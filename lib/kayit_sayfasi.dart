import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'kullanici_listesi_sayfasi.dart';

class KayitSayfasi extends StatefulWidget {
  @override
  _KayitSayfasiState createState() => _KayitSayfasiState();
}

class _KayitSayfasiState extends State<KayitSayfasi> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _kullaniciAdiController = TextEditingController();
  final TextEditingController _sifreController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  
  Future<void> _kayitOl() async {
  try {
    print("Kayıt işlemi başladı.");

    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _sifreController.text.trim(),
    );

    print("Kullanıcı oluşturuldu: ${credential.user!.uid}");

    final uid = credential.user!.uid;

    final ref = FirebaseDatabase.instance.ref().child("kullanicilar").child(uid);

    await ref.set({
      "kullaniciAdi": _kullaniciAdiController.text.trim(),
      "email": _emailController.text.trim(),
      "kayitTarihi": DateTime.now().toIso8601String(),
    });

    print("Veri veritabanına kaydedildi.");

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Kayıt başarılı!")),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => KullaniciListesiSayfasi()),
    );
  } on FirebaseAuthException catch (e) {
    print("FirebaseAuth hatası: ${e.message}");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Hata: ${e.message}")),
    );
  } catch (e) {
    print("Bilinmeyen hata: $e");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Bilinmeyen hata: $e")),
    );
  }
}

  @override
  void dispose() {
    _kullaniciAdiController.dispose();
    _sifreController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kayıt Ol"),
        backgroundColor: Color.fromARGB(255, 188, 144, 230),
      ),
      backgroundColor: Color.fromARGB(255, 230, 232, 221),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "E-posta"),
                validator: (value) =>
                    value == null || value.isEmpty ? "E-posta zorunlu" : null,
              ),
              TextFormField(
                controller: _kullaniciAdiController,
                decoration: InputDecoration(labelText: "Kullanıcı Adı"),
                validator: (value) =>
                    value == null || value.isEmpty ? "Kullanıcı adı zorunlu" : null,
              ),
              TextFormField(
                controller: _sifreController,
                decoration: InputDecoration(labelText: "Şifre"),
                obscureText: true,
                validator: (value) =>
                    value == null || value.isEmpty ? "Şifre zorunlu" : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _kayitOl();
                  }
                },
                child: Text("Kayıt Ol"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 188, 144, 230),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}