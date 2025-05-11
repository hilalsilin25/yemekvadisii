import 'package:flutter/material.dart';

class Pilavlar extends StatelessWidget {
  final List<Map<String, String>> pilavlar = [
    {
      'isim': 'Şehriyeli Pirinç Pilavı',
      'tarif': '''Malzemeler:
- 2 su bardağı pirinç
- 1 çay bardağı arpa şehriye
- 2,5 su bardağı sıcak su
- 2 yemek kaşığı tereyağı
- 1 yemek kaşığı sıvı yağ
- Tuz

Yapılışı:
Pirinçleri tuzlu sıcak suda yarım saat beklet. İyice yıka ve süz.
Tencerede tereyağı ve sıvı yağı kızdır, şehriyeleri pembeleştir.
Üzerine pirinci ekleyip 5 dakika kavur.
Sıcak su ve tuz ekle, kapağını kapat.
Kısık ateşte suyunu çekene kadar pişir. 
Demlendirip, tane tane servis et.''',
    },
    {
      'isim': 'Bulgur Pilavı',
      'tarif': '''Malzemeler:
- 1,5 su bardağı pilavlık bulgur
- 1 adet kuru soğan
- 2 adet domates (veya salça)
- 3 su bardağı sıcak su
- 2 yemek kaşığı tereyağı
- Tuz, karabiber

Yapılışı:
Soğanı ince doğrayıp yağda kavur.
Üzerine doğranmış domates veya salça ekle, kokusu çıkınca bulguru kat.
Bulguru da kavur, sıcak su ve baharatları ekle.
Kısık ateşte suyunu çekene kadar pişir.
Demlendirip, yanında yoğurtla sun. Efsane olur!''',
    },
    {
      'isim': 'İç Pilav (Kuş Üzümlü, Fıstıklı)',
      'tarif': '''Malzemeler:
- 2 su bardağı pirinç
- 2 yemek kaşığı dolmalık fıstık
- 2 yemek kaşığı kuş üzümü
- 1 adet kuru soğan
- 2,5 su bardağı sıcak su
- 2 yemek kaşığı tereyağı
- Tarçın, karabiber, yenibahar, tuz

Yapılışı:
Soğanı yağda kavur, fıstıkları ekle altın rengi olana kadar çevir.
Pirinçleri ekleyip kavur.
Kuş üzümü ve baharatları da ekle.
Sıcak suyu ver, kapağını kapat.
Kısık ateşte suyunu çektir. Şölen gibi iç pilav hazır!''',
    },
    {
      'isim': 'Etli Pilav',
      'tarif': '''Malzemeler:
- 300 gr kuşbaşı dana eti
- 2 su bardağı pirinç
- 2,5 su bardağı et suyu
- 2 yemek kaşığı tereyağı
- Tuz, karabiber

Yapılışı:
Eti kavurup suyunu çekmesini bekle.
Pirinçleri ekleyip 5 dakika kavur.
Sıcak et suyunu ve baharatları ekle.
Kısık ateşte pişir. Dinlendir ve harmanla.
Doyurucu ve nefis bir ana yemek olur!''',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: pilavlar.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Pilavlar'),
          backgroundColor: Colors.deepOrange,
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Arama butonuna basıldığında yapılacak işlemi buraya yaz
                showSearch(
                  context: context,
                  delegate: PilavSearchDelegate(pilavlar),
                );
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: pilavlar.map((pilav) {
                  return Padding(
                    padding: EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Malzemeler',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            pilav['tarif']!.split("Yapılışı:")[0], // Malzemeleri ayırdım
                            style: TextStyle(fontSize: 18, color: Colors.black87),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Tarif',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            pilav['tarif']!.split("Yapılışı:")[1], // Tarifi ayırdım
                            style: TextStyle(fontSize: 18, color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Container(
              color: Colors.deepOrange,
              child: TabBar(
                tabs: pilavlar.map((pilav) {
                  return Tab(
                    text: pilav['isim'],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PilavSearchDelegate extends SearchDelegate {
  final List<Map<String, String>> pilavlar;

  PilavSearchDelegate(this.pilavlar);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = pilavlar.where((pilav) {
      return pilav['isim']!.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView(
      children: results.map((pilav) {
        return ListTile(
          title: Text(pilav['isim']!),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(pilav['isim']!),
                content: SingleChildScrollView(
                  child: Text(
                    pilav['tarif']!,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Kapat'),
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = pilavlar.where((pilav) {
      return pilav['isim']!.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView(
      children: suggestions.map((pilav) {
        return ListTile(
          title: Text(pilav['isim']!),
          onTap: () {
            query = pilav['isim']!;
            showResults(context);
          },
        );
      }).toList(),
    );
  }
}