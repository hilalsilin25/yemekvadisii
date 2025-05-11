import 'package:flutter/material.dart';
import 'package:yemekvadisii/pages/Tatlilar.dart';
import 'package:yemekvadisii/pages/Corbalar.dart';
import 'package:yemekvadisii/pages/Baklagiller.dart';
import 'package:yemekvadisii/pages/Pilavlar.dart';
import 'package:yemekvadisii/pages/Ayarlar.dart';
import 'package:yemekvadisii/pages/main.dart'; // main.dart içindeki LoginScreen'i import ettik

class AnaSayfa extends StatefulWidget {
  final bool karanlikMod;
  final Function(bool) onKaranlikModChanged;

  AnaSayfa({required this.karanlikMod, required this.onKaranlikModChanged});

  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  final List<Map<String, dynamic>> menuList = [
    {
      'title': 'Tatlılar',
      'icon': Icons.cake,
      'page': Tatlilar(),
    },
    {
      'title': 'Çorbalar',
      'icon': Icons.local_dining,
      'page': CorbalarSayfasi(),
    },
    {
      'title': 'Baklagiller',
      'icon': Icons.eco,
      'page': Baklagiller(),
    },
    {
      'title': 'Pilavlar',
      'icon': Icons.rice_bowl,
      'page': Pilavlar(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text("Hilal Silin"),
              accountEmail: Text("hilal.silin25@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/atakan.jpg"),
              ),
              decoration: BoxDecoration(color: Colors.deepOrange),
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.deepOrange),
              title: Text('Ayarlar'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Ayarlar(
                      karanlikMod: widget.karanlikMod,
                      onKaranlikModChanged: widget.onKaranlikModChanged,
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.deepOrange),
              title: Text('Çıkış Yap'),
              onTap: () {
                // Çıkış yapınca giriş ekranına yönlendiriyoruz
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => GirisSayfasi()), // main.dart içindeki GirisSayfasi'na yönlendirme
                  (route) => false, // Tüm önceki sayfaları kapat
                );
              },
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.deepOrange,
            expandedHeight: 120,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('🍽️ Yemek Vadisi'),
              centerTitle: true,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  '"Yemek, sevgiyi en güzel şekilde ifade etmenin yoludur."',
                  style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    color: Colors.deepOrange,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final item = menuList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    elevation: 5,
                    color: Colors.orange.shade50,
                    child: ListTile(
                      leading: Icon(item['icon'], color: Colors.deepOrange),
                      title: Text(item['title'], style: TextStyle(fontSize: 20)),
                      trailing: Icon(Icons.chevron_right, color: Colors.deepOrange),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => item['page']),
                        );
                      },
                    ),
                  ),
                );
              },
              childCount: menuList.length,
            ),
          ),
        ],
      ),
    );
  }
}