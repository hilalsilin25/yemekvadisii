import 'package:flutter/material.dart';
import 'package:yemekvadisii/pages/Corbalar.dart';
import 'package:yemekvadisii/pages/Pilavlar.dart';
import 'package:yemekvadisii/pages/Ayarlar.dart';
import 'package:yemekvadisii/pages/Tatlilar.dart';
import 'package:yemekvadisii/pages/Baklagiller.dart';
import 'package:yemekvadisii/pages/AnaSayfa.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import '../firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
      initialRoute: '/hosgeldiniz',
      routes: {
        '/hosgeldiniz': (context) => HosgeldinizSayfasi(),
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
        '/kullanicilar': (context) => KullaniciListesiSayfasi(),
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
        backgroundColor: const Color.fromARGB(255, 188, 144, 230),
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
                color: const Color.fromARGB(255, 33, 13, 37),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: Text("Giriş Yap"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 188, 144, 230),
              ),
          ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 230, 232, 221),
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
      // TODO: Burada Firebase Auth ile gerçek giriş yapabilirsin
      Navigator.pushReplacementNamed(context, '/anasayfa');
    }
  }

  void _kayitOl() {
    Navigator.pushNamed(context, '/kayit');
  }

  void _kullaniciListesi() {
    Navigator.pushNamed(context, '/kullanicilar');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yemek Vadisi - Giriş"),
        backgroundColor: const Color.fromARGB(255, 188, 144, 230),
      ),
      backgroundColor: const Color.fromARGB(255, 230, 232, 221),
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
                  backgroundColor: const Color.fromARGB(255, 188, 144, 230),
              ),
              ),
              SizedBox(height: 10),
            TextButton(
                onPressed: _kayitOl,
                child: Row(
                 mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.food_bank,
                      color: const Color.fromARGB(255, 188, 144, 230),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Yeni Hesap Oluştur",
                      style:
                          TextStyle(color: const Color.fromARGB(255, 188, 144, 230)),
                    ),
                  ],
               ),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.deepOrange,
                ),
              ),
              // İstersen kullanıcı listesini görmek için buton:
              SizedBox(height: 10),
              TextButton(
                onPressed: _kullaniciListesi,
                child: Text("Kullanıcı Listesini Görüntüle"),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blueAccent,
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

  Future<void> _kayitOl() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(), password: _sifreController.text.trim());

      final uid = credential.user!.uid;

      final veritabani = FirebaseDatabase.instance.ref();
      await veritabani.child("kullanicilar").child(uid).set({
        "kullaniciAdi": _kullaniciAdController.text.trim(),
        "email": _emailController.text.trim(),
        "kayitTarihi": DateTime.now().toIso8601String(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Kayıt başarılı!")),
      );

      Navigator.pushReplacementNamed(context, '/anasayfa');
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Hata: ${e.message}")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Bilinmeyen hata: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Hesap Oluştur"),
        backgroundColor: const Color.fromARGB(255, 188, 144, 230),
      ),
      backgroundColor: const Color.fromARGB(255, 230, 232, 221),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !value.contains('@')) {
                    return 'Geçerli bir email giriniz';
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
                  if (value == null || value.length < 6) {
                    return 'Şifre en az 6 karakter olmalı';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _kayitOl,
                child: Text("Kayıt Ol"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 188, 144, 230),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KullaniciListesiSayfasi extends StatefulWidget {
  @override
  _KullaniciListesiSayfasiState createState() =>
      _KullaniciListesiSayfasiState();
}

class _KullaniciListesiSayfasiState extends State<KullaniciListesiSayfasi> {
  final DatabaseReference _dbRef =
      FirebaseDatabase.instance.ref().child('kullanicilar');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kullanıcı Listesi'),
        backgroundColor: const Color.fromARGB(255, 188, 144, 230),
      ),
      backgroundColor: const Color.fromARGB(255, 230, 232, 221),
      body: StreamBuilder(
        stream: _dbRef.onValue,
        builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
          if (snapshot.hasData &&
              snapshot.data != null &&
              snapshot.data!.snapshot.value != null) {
            Map<dynamic, dynamic> kullanicilar =
                snapshot.data!.snapshot.value as Map<dynamic, dynamic>;

            List<MapEntry> kullaniciListesi = kullanicilar.entries.toList();

            return ListView.builder(
              itemCount: kullaniciListesi.length,
              itemBuilder: (context, index) {
                var kullanici = kullaniciListesi[index].value;
                return ListTile(
                  title: Text(kullanici['kullaniciAdi'] ?? "İsimsiz"),
                  subtitle: Text(kullanici['email'] ?? "Email yok"),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Hata: ${snapshot.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
   }
}
