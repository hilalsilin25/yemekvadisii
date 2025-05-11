import 'package:flutter/material.dart';

class Ayarlar extends StatefulWidget {
  final bool karanlikMod;
  final Function(bool) onKaranlikModChanged;

  Ayarlar({required this.karanlikMod, required this.onKaranlikModChanged});

  @override
  _AyarlarState createState() => _AyarlarState();
}

class _AyarlarState extends State<Ayarlar> {
  bool _bildirimlerAcik = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ayarlar'),
        backgroundColor:  const Color.fromARGB(255, 188, 144, 230),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Karanlık Mod'),
            value: widget.karanlikMod,  // Burada widget.karanlikMod kullanıyoruz.
            onChanged: (bool value) {
              setState(() {
                widget.onKaranlikModChanged(value);  // Karanlık mod değiştiğinde callback'i çağırıyoruz.
              });
            },
            secondary: Icon(Icons.dark_mode),
          ),
          SwitchListTile(
            title: Text('Bildirimler'),
            value: _bildirimlerAcik,
            onChanged: (bool value) {
              setState(() {
                _bildirimlerAcik = value;
              });
            },
            secondary: Icon(Icons.notifications),
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Şifre Değiştir'),
            onTap: () {
              // Buraya şifre değiştirme ekranı yönlendirmesi yapılır
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Şifre Değiştir kısmına tıkladın')),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Uygulama Hakkında'),
            onTap: () {
              // Hakkında sayfasına yönlendirilebilir
              showAboutDialog(
                context: context,
                applicationName: 'Yemek Vadisi',
                applicationVersion: '1.0.0',
                applicationLegalese: '© 2025 Yemek Vadisi',
              );
            },
          ),
        ],
      ),
    );
  }
}