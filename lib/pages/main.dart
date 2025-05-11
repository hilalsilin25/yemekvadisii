import 'package:flutter/material.dart';
import 'package:yemekvadisii/pages/Corbalar.dart';
import 'package:yemekvadisii/pages/Pilavlar.dart';
import 'package:yemekvadisii/pages/Ayarlar.dart';
import 'package:yemekvadisii/pages/Tatlilar.dart';
import 'package:yemekvadisii/pages/Baklagiller.dart';
import 'package:yemekvadisii/pages/AnaSayfa.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(GirisSayfasiApp());
}

class GirisSayfasiApp extends StatefulWidget {
  @override
  _GirisSayfasiAppState createState() => _GirisSayfasiAppState();
}

class _GirisSayfasiAppState extends State<GirisSayfasiApp> {
  bool _karanlikMod = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/hoşgeldiniz',
      routes: {
        '/hoşgeldiniz': (context) => HosgeldinizSayfasi(),
        '/': (context) => GirisSayfasi(),
        '/anasayfa': (context) => AnaSayfa(
          karanlikMod: _karanlikMod, 
          onKaranlikModChanged: (bool value) {
            setState(() {
              _karanlikMod = value;
            });
          },
        ),
        '/tatlilar': (context) => Tatlilar(),
        '/corbalar': (context) => CorbalarSayfasi(),
        '/pilavlar': (context) => Pilavlar(),
        '/ayarlar': (context) => Ayarlar(
          karanlikMod: _karanlikMod,
          onKaranlikModChanged: (bool value) {
            setState(() {
              _karanlikMod = value;
            });
          },
        ),
        '/baklagiller': (context) => Baklagiller(),
        '/kayit': (context) => KayitSayfasi(),
      },
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _karanlikMod ? ThemeMode.dark : ThemeMode.light,
    );
  }
}

class HosgeldinizSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yemek Vadisi"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Yemek Vadisi\'ne Hoş Geldiniz!',
              style: GoogleFonts.lobster(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: Text("Giriş Yap"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
              ),
            ),
           
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 218, 106, 32),
    );
  }
}

class GirisSayfasi extends StatefulWidget {
  @override
  _GirisSayfasiState createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi> {
  final TextEditingController _kullaniciAdController = TextEditingController();
  final TextEditingController _sifreController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _girisYap() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, '/anasayfa');
    }
  }

  void _kayitOl() {
    Navigator.pushNamed(context, '/kayit');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yemek Vadisi - Giriş"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _kullaniciAdController,
                decoration: InputDecoration(labelText: "Kullanıcı Adı"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kullanıcı adı boş olamaz';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _sifreController,
                decoration: InputDecoration(labelText: "Şifre"),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Şifre boş olamaz';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _girisYap,
                child: Text("Giriş Yap"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: _kayitOl,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.food_bank, color: Colors.deepOrange),
                    SizedBox(width: 10),
                    Text("Yeni Hesap Oluştur", style: TextStyle(color: Colors.deepOrange)),
                  ],
                ),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.deepOrange,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KayitSayfasi extends StatefulWidget {
  @override
  _KayitSayfasiState createState() => _KayitSayfasiState();
}

class _KayitSayfasiState extends State<KayitSayfasi> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _kullaniciAdController = TextEditingController();
  final TextEditingController _sifreController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _kayitOl() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, '/anasayfa');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yemek Vadisi - Kayıt Ol"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "E-posta"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'E-posta boş olamaz';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _kullaniciAdController,
                decoration: InputDecoration(labelText: "Kullanıcı Adı"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kullanıcı adı boş olamaz';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _sifreController,
                decoration: InputDecoration(labelText: "Şifre"),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Şifre boş olamaz';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _kayitOl,
                child: Text("Hesap Oluştur"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}