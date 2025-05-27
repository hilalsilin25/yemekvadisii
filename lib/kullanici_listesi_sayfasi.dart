import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class KullaniciListesiSayfasi extends StatefulWidget {
  @override
  _KullaniciListesiSayfasiState createState() => _KullaniciListesiSayfasiState();
}

class _KullaniciListesiSayfasiState extends State<KullaniciListesiSayfasi> {
  final DatabaseReference _ref = FirebaseDatabase.instance.ref().child('kullanicilar');
  List<Map<dynamic, dynamic>> _kullanicilar = [];
  bool _yukleniyor = true;

  @override
  void initState() {
    super.initState();
    _verileriGetir();
  }

  void _verileriGetir() {
    _ref.onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;

      if (data != null) {
        List<Map<dynamic, dynamic>> kullaniciListesi = [];
        data.forEach((key, value) {
          kullaniciListesi.add({
            "id": key,
            "kullaniciAdi": value['kullaniciAdi'],
            "email": value['email'],
            "kayitTarihi": value['kayitTarihi'],
          });
        });

        setState(() {
          _kullanicilar = kullaniciListesi;
          _yukleniyor = false;
        });
      } else {
        setState(() {
          _kullanicilar = [];
          _yukleniyor = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kullanıcı Listesi'),
        backgroundColor: Color.fromARGB(255, 188, 144, 230),
      ),
      body: _yukleniyor
          ? Center(child: CircularProgressIndicator())
          : _kullanicilar.isEmpty
              ? Center(child: Text('Kullanıcı bulunamadı.'))
              : ListView.builder(
                  itemCount: _kullanicilar.length,
                  itemBuilder: (context, index) {
                    final kullanici = _kullanicilar[index];
                    return ListTile(
                      leading: Icon(Icons.person),
                      title: Text(kullanici['kullaniciAdi'] ?? ''),
                      subtitle: Text(kullanici['email'] ?? ''),
                      trailing: Text(
                        kullanici['kayitTarihi'] != null
                            ? DateTime.tryParse(kullanici['kayitTarihi'])
                                    ?.toLocal()
                                    .toString()
                                    .split(' ')[0] ??
                                ''
                            : '',
                      ),
                    );
                  },
                ),
    );
  }
}