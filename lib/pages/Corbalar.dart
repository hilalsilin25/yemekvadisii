import 'package:flutter/material.dart';
import 'tarifler.dart'; // Tarifler sayfasını import ettik

final List<String> corbalar = [
  'Mercimek Çorbası',
  'Tarator Çorbası',
  'Yoğurtlu Çorba',
  'Beyran Çorbası',
  'Kesme Aşı Çorbası',
  'Kısır Çorbası',
  'Domates Çorbası',
  'Tavuk Çorbası',
  'Ezo Gelin Çorbası',
  'Sebze Çorbası',
  'Brokoli Çorbası', 
  'Şehriye Çorbası', 
  'Köfteli Çorba',
  'Mantarlı Çorba', 
  'Çılbır Çorbası', 
];

class CorbalarSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Çorbalar', 
          style: TextStyle(color: Colors.white), // Başlık rengi beyaz
        ),
        backgroundColor: Colors.deepOrange, // Başlık arka planı turuncu
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3,
        ),
        itemCount: corbalar.length,
        itemBuilder: (context, index) {
          Color cardColor = index.isEven
              ? Colors.orangeAccent
              : Colors.greenAccent; // Renkler burada değişiyor

          return GestureDetector(
            onTap: () {
              // Tıklanan çorba ismiyle Tarifler sayfasına yönlendir
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TariflerSayfasi(corbaAdi: corbalar[index]),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.all(8),
              elevation: 5,
              color: cardColor, // Arka plan rengini burada uyguluyoruz
              child: Center(
                child: Text(
                  corbalar[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}