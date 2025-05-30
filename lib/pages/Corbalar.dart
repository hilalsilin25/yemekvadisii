import 'package:flutter/material.dart';
import 'tarifler.dart';


final List<String> tumCorbalar = [
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
class CorbalarSayfasi extends StatefulWidget {
  @override
  _CorbalarSayfasiState createState() => _CorbalarSayfasiState();
}

class _CorbalarSayfasiState extends State<CorbalarSayfasi> {
  List<String> filtreliCorbalar = List.from(tumCorbalar);
  List<String> favoriler = [];

  void aramaDialogAc(BuildContext context) {
    TextEditingController aramaController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Çorba Ara"),
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
              String aranan = aramaController.text.toLowerCase();
              setState(() {
                filtreliCorbalar = tumCorbalar
                    .where((c) => c.toLowerCase().contains(aranan))
                    .toList();
              });
              Navigator.pop(context);
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

  void favoriDegistir(String corba) {
    setState(() {
      if (favoriler.contains(corba)) {
        favoriler.remove(corba);
      } else {
        favoriler.add(corba);
      }
    });
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
        itemCount: filtreliCorbalar.length,
        itemBuilder: (context, index) {
          final corba = filtreliCorbalar[index];
          final favoriMi = favoriler.contains(corba);

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TariflerSayfasi(corbaAdi: corba),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.purple[900]!,
                  width: 2.5,
                ),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Text(
                      corba,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple[900],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: favoriMi ? Colors.red : Colors.grey,
                      ),
                      onPressed: () => favoriDegistir(corba),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
