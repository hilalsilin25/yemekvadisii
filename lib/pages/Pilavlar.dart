import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Pilavlar extends StatefulWidget {
  @override
  _PilavlarState createState() => _PilavlarState();
}

// Arama sayfası için basit SearchDelegate
class PilavArama extends SearchDelegate<String> {
  final List<String> pilavIsimleri;

  PilavArama(this.pilavIsimleri);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () => query = '',
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, ''),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = pilavIsimleri
        .where((p) => p.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView(
      children: results
          .map((p) => ListTile(
                title: Text(p),
                onTap: () => close(context, p),
              ))
          .toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = pilavIsimleri
        .where((p) => p.toLowerCase().startsWith(query.toLowerCase()))
        .toList();

    return ListView(
      children: suggestions
          .map((p) => ListTile(
                title: Text(p),
                onTap: () {
                  query = p;
                  showResults(context);
                },
              ))
          .toList(),
    );
  }
}

class _PilavlarState extends State<Pilavlar> {
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
Kısık ateşte piş. Dinlendir ve harmanla.
Doyurucu ve nefis bir ana yemek olur!''',
    },
  ];

  List<bool> expandedStatus = [];

  List<List<Map<String, dynamic>>> yorumlarListesi = [];
  List<TextEditingController> yorumControllerListesi = [];

  @override
  void initState() {
    super.initState();
    expandedStatus = List<bool>.filled(pilavlar.length, false);
    yorumlarListesi = List.generate(pilavlar.length, (_) => []);
    yorumControllerListesi = List.generate(pilavlar.length, (_) => TextEditingController());
  }

  void toggleExpanded(int index) {
    setState(() {
      expandedStatus[index] = !expandedStatus[index];
    });
  }

  void yorumEkle(int index) {
    final text = yorumControllerListesi[index].text.trim();
    if (text.isEmpty) return;

    setState(() {
      yorumlarListesi[index].add({'text': text, 'begenme': 0});
      yorumControllerListesi[index].clear();
    });
  }

  void yorumSil(int pilavIndex, int yorumIndex) {
    setState(() {
      yorumlarListesi[pilavIndex].removeAt(yorumIndex);
    });
  }

  void yorumBegen(int pilavIndex, int yorumIndex) {
    setState(() {
      yorumlarListesi[pilavIndex][yorumIndex]['begenme']++;
    });
  }

  @override
  void dispose() {
    for (var c in yorumControllerListesi) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _launchGoogle(String aramaKelimesi) async {
    final query = Uri.encodeComponent('$aramaKelimesi tarifi');
    final Uri url = Uri.parse('https://www.google.com/search?q=$query');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Google açılamadı!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: pilavlar.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Pilavlar', style: TextStyle(color: Colors.grey.shade200)),
          backgroundColor: Color(0xFF9575CD),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                final result = await showSearch<String>(
                  context: context,
                  delegate: PilavArama(pilavlar.map((e) => e['isim']!).toList()),
                );
                if (result != null && result.isNotEmpty) {
                  final index = pilavlar.indexWhere((p) => p['isim'] == result);
                  if (index != -1) {
                    DefaultTabController.of(context)?.animateTo(index);
                  }
                }
              },
              tooltip: 'Pilav Ara',
            ),
            Builder(
              builder: (context) {
                final tabController = DefaultTabController.of(context);
                final currentIndex = tabController?.index ?? 0;
                return IconButton(
                  icon: Icon(Icons.public),
                  onPressed: () => _launchGoogle(pilavlar[currentIndex]['isim']!),
                  tooltip: '${pilavlar[currentIndex]['isim']} tarifini Google\'da ara',
                );
              },
            ),
          ],
          bottom: TabBar(
            indicatorColor: Color(0xFF512DA8),
            labelColor: Color(0xFF512DA8),
            unselectedLabelColor: Colors.black,
            tabs: pilavlar.map((p) => Tab(text: p['isim'])).toList(),
          ),
        ),
        body: TabBarView(
          children: pilavlar.asMap().entries.map((entry) {
            int index = entry.key;
            Map<String, String> pilav = entry.value;

            bool isExpanded = expandedStatus[index];

            return SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: InkWell(
                onTap: () => toggleExpanded(index),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pilav['isim']!,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF512DA8),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        pilav['tarif']!.split("Yapılışı:")[0],
                        style: TextStyle(fontSize: 18, color: Colors.black87),
                      ),
                      if (isExpanded) ...[
                        SizedBox(height: 16),
                        Divider(color: Color(0xFF512DA8)),
                        Text(
                          'Tarif:',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF512DA8),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          pilav['tarif']!.split("Yapılışı:")[1],
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Yorumlar:',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF512DA8),
                          ),
                        ),
                        SizedBox(height: 8),
                        ...yorumlarListesi[index].asMap().entries.map((yorumEntry) {
                          int yorumIndex = yorumEntry.key;
                          var yorum = yorumEntry.value;
                          return Card(
                            margin: EdgeInsets.symmetric(vertical: 4),
                            child: ListTile(
                              title: Text(yorum['text']),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('${yorum['begenme']}'),
                                  IconButton(
                                    icon: Icon(Icons.thumb_up, color: Colors.purple),
                                    onPressed: () => yorumBegen(index, yorumIndex),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete, color: Colors.red),
                                    onPressed: () => yorumSil(index, yorumIndex),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                        TextField(
                          controller: yorumControllerListesi[index],
                          decoration: InputDecoration(
                            labelText: 'Yorum ekle',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF9575CD)),
                          onPressed: () => yorumEkle(index),
                          child: Text('Yorum Gönder'),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
