import 'package:flutter/material.dart';
import 'tarifler.dart';
import 'package:url_launcher/url_launcher.dart';

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
  void googleAramaYap(BuildContext context, String kelime) async {
    final url = 'https://www.google.com/search?q=${Uri.encodeComponent(kelime)}';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Google araması başlatılamadı!")),
      );
    }
  }

  void aramaDialogAc(BuildContext context) {
    TextEditingController aramaController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Google'da Ara"),
        content: TextField(
          controller: aramaController,
          decoration: InputDecoration(hintText: "Bir çorba mı arıyorsun paşam?"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("İptal"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              googleAramaYap(context, aramaController.text);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple[300],
            ),
            child: Text("Ara"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Çorbalar',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 188, 144, 230),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () => aramaDialogAc(context),
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(12),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1,
        ),
        itemCount: corbalar.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TariflerSayfasi(corbaAdi: corbalar[index]),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200, // Hafif gri iç renk
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.purple[900]!, // Koyu mor kenarlık
                  width: 2.5,
                ),
              ),
              child: Center(
                child: Text(
                  corbalar[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple[900], // Koyu mor yazı
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}