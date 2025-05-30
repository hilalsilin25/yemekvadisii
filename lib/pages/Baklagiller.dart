import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Baklagiller extends StatelessWidget {
  final List<Map<String, String>> baklagiller = [
    {'isim': 'Kuru Fasulye', 
     'malzemeler': '''- 2 su bardağı kuru fasulye
- 1 adet soğan
- 1 yemek kaşığı domates salçası
- 2 yemek kaşığı sıvı yağ
- Tuz, karabiber, pul biber, kimyon
- 6 su bardağı su''',
     'tarif': '''1. Kuru fasulyeleri akşamdan önce bol suyla ıslatın. 
2. Soğanı doğrayıp sıvı yağda pembeleşene kadar kavurun. 
3. Ardından salçayı ekleyip kavurmaya devam edin. 
4. İçine ıslattığınız fasulyeleri, suyu ve baharatları ekleyin. 
5. Karıştırıp kısık ateşte pişirin. 
6. Fasulyeler yumuşayana kadar pişmeye devam etsin. 
Yanında pilav ve turşuyla servis edebilirsiniz.'''},
    
    {'isim': 'Nohut',
     'malzemeler': '''- 2 su bardağı nohut
- 1 adet soğan
- 1 yemek kaşığı domates salçası
- 2 yemek kaşığı sıvı yağ
- Tuz, karabiber, kimyon, pul biber
- 6 su bardağı su''',
     'tarif': '''1. Nohutları akşamdan ıslatın, ardından tencerede haşlayın. 
2. Soğanı ince doğrayıp sıvı yağda kavurun. 
3. Haşlanmış nohutu, tuz, baharat ve et (isteğe bağlı) ekleyip harmanlayın. 
4. Biraz daha kavurun, üzerine suyu ekleyin ve kısık ateşte pişirin. 
Yanında yoğurtla çok lezzetli olur.'''},
    
    {'isim': 'Yeşil Mercimek', 
     'malzemeler': '''- 2 su bardağı yeşil mercimek
- 1 adet soğan
- 1 yemek kaşığı domates salçası
- 2 yemek kaşığı sıvı yağ
- Tuz, karabiber, pul biber
- 6 su bardağı su''',
     'tarif': '''1. Yeşil mercimekleri yıkayıp haşlayın. 
2. Ayrı bir tavada doğranmış soğanı sıvı yağda kavurun. 
3. Haşlanan mercimeği ekleyin ve karıştırın. 
4. Biraz tuz, karabiber ve pul biber ekleyin. 
5. Üzerine suyu ekleyip kaynamaya bırakın. 
6. Mercimekler iyice yumuşadıktan sonra ocaktan alın ve sıcak servis edin.'''},
    
    {'isim': 'Barbunya',
     'malzemeler': '''- 2 su bardağı barbunya
- 1 adet soğan
- 1 yemek kaşığı domates salçası
- 2 yemek kaşığı sıvı yağ
- Tuz, karabiber, pul biber
- 6 su bardağı su''',
     'tarif': '''1. Barbunya fasulyelerini akşamdan önce ıslatın. 
2. Soğanı doğrayıp sıvı yağda kavurun. 
3. Ardından salçayı ekleyin ve karıştırın. 
4. Barbunyaları, baharatları ve suyu ekleyip pişirmeye başlayın. 
5. Kısık ateşte fasulyeler yumuşayana kadar pişirin. 
Barbunya, pilav ve turşu ile harika gider.'''},
    
    {'isim': 'Bakla', 
     'malzemeler': '''- 1 kg taze bakla
- 1 adet soğan
- 2 yemek kaşığı sıvı yağ
- Tuz, karabiber, pul biber
- Yarım çay bardağı zeytinyağı
- 1 yemek kaşığı dereotu''',
     'tarif': '''1. Taze baklaları ayıklayın ve kabuklarını çıkarın. 
2. Bir tencerede baklaları haşlayın. 
3. Ayrı bir tavada sıvı yağda soğanı kavurun, ardından baklaları ekleyin. 
4. Dereotu ve tuz ekleyip biraz daha kavurun. 
5. Servis sırasında yanında yoğurtla sunabilirsiniz. 
Lezzetli ve sağlıklı bir yaz yemeğidir.'''},
    
    {'isim': 'Fasulye', 
     'malzemeler': '''- 2 su bardağı fasulye
- 1 adet soğan
- 1 yemek kaşığı domates salçası
- 2 yemek kaşığı sıvı yağ
- Tuz, karabiber, pul biber
- 6 su bardağı su''',
     'tarif': '''1. Fasulyeleri bir gün önceden ıslatın ve haşlayın. 
2. Tencereye sıvı yağ koyup soğanı kavurun, salçayı ekleyip kavurmaya devam edin. 
3. Fasulyeleri ekleyin, baharatları ekleyip kısık ateşte pişirin. 
Yanında pilavla servis edin.'''},
    
    {'isim': 'Bezelye', 
     'malzemeler': '''- 2 su bardağı bezelye
- 1 adet soğan
- 1 yemek kaşığı domates salçası
- 2 yemek kaşığı sıvı yağ
- Tuz, karabiber
- 6 su bardağı su''',
     'tarif': '''1. Bezelyeleri haşlayın. 
2. Soğanı doğrayıp sıvı yağda kavurun. 
3. Salçayı ekleyip biraz kavurduktan sonra bezelyeleri ve baharatları ekleyin. 
4. Suyu ekleyip kısık ateşte pişirin. 
Yanında pilavla çok lezzetli olur.'''},
    
    {'isim': 'Soya Fasulyesi', 
     'malzemeler': '''- 2 su bardağı soya fasulyesi
- 1 adet soğan
- 1 yemek kaşığı domates salçası
- 2 yemek kaşığı sıvı yağ
- Tuz, karabiber
- 6 su bardağı su''',
     'tarif': '''1. Soyaları akşamdan ıslatıp haşlayın. 
2. Soğanı kavurun, salçayı ekleyip kavurun. 
3. Soyaları ekleyip baharatları ekleyin, suyu ilave edip kısık ateşte pişirin. 
Yanında pilavla servis edin.'''},
    
    {'isim': 'Çökelek', 
     'malzemeler': '''- 1 kg çökelek
- 1 adet soğan
- 2 yemek kaşığı sıvı yağ
- Tuz, karabiber
- 6 su bardağı su''',
     'tarif': '''1. Çökelekleri tencerede haşlayın. 
2. Soğanı doğrayıp sıvı yağda kavurun. 
3. Çökelekleri ekleyin, baharatları ekleyip pişirin. 
Yanında pilavla servis edebilirsiniz.'''},
  ];
 

  // Google arama fonksiyonu
  void googleAramaYap(BuildContext context, String aramaKelimesi) async {
    final url = 'https://www.google.com/search?q=${Uri.encodeComponent(aramaKelimesi)}';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Google araması açılamadı!")),
      );
    }
  }

  // Arama dialogu açma ve uygulama içi filtreleme
  void aramaDialogAc(BuildContext context) {
    TextEditingController aramaController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Baklagillerde Ara"),
        content: TextField(
          controller: aramaController,
          decoration: InputDecoration(hintText: "Ne aramak istiyorsun paşam?"),
        ),
        actions: [
          TextButton(
            child: Text("İptal"),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 188, 144, 230),
              foregroundColor: Colors.white,
            ),
            child: Text("Ara"),
            onPressed: () {
              String aranan = aramaController.text.toLowerCase();
              Navigator.pop(context);

              // Yeni sayfa ile filtrelenmiş verileri göster
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    appBar: AppBar(
                      title: Text("Arama Sonuçları"),
                      backgroundColor: Color.fromARGB(255, 188, 144, 230),
                    ),
                    body: GridView.builder(
                      padding: EdgeInsets.all(10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1,
                      ),
                      itemCount: baklagiller
                          .where((e) => e['isim']!.toLowerCase().contains(aranan))
                          .length,
                      itemBuilder: (context, index) {
                        final filtrelenmis = baklagiller
                            .where((e) => e['isim']!.toLowerCase().contains(aranan))
                            .toList();
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TarifDetaySayfasi(
                                  isim: filtrelenmis[index]['isim']!,
                                  malzemeler: filtrelenmis[index]['malzemeler']!,
                                  tarif: filtrelenmis[index]['tarif']!,
                                  googleAramaYap: googleAramaYap,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 243, 231, 253),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: Color.fromARGB(255, 172, 120, 203),
                                  width: 2),
                            ),
                            child: Center(
                              child: Text(
                                filtrelenmis[index]['isim']!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 63, 15, 73),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Baklagiller',
            style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold)),
        backgroundColor: Color.fromARGB(255, 188, 144, 230),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => aramaDialogAc(context),
          )
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemCount: baklagiller.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TarifDetaySayfasi(
                    isim: baklagiller[index]['isim']!,
                    malzemeler: baklagiller[index]['malzemeler']!,
                    tarif: baklagiller[index]['tarif']!,
                    googleAramaYap: googleAramaYap,
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 243, 231, 253),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color.fromARGB(255, 172, 120, 203), width: 2),
              ),
              child: Center(
                child: Text(
                  baklagiller[index]['isim']!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 63, 15, 73),
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

class TarifDetaySayfasi extends StatefulWidget {
  final String isim;
  final String malzemeler;
  final String tarif;
  final Function(BuildContext, String) googleAramaYap;

  TarifDetaySayfasi({
    required this.isim,
    required this.malzemeler,
    required this.tarif,
    required this.googleAramaYap,
  });

   @override
  _TarifDetaySayfasiState createState() => _TarifDetaySayfasiState();
}

class _TarifDetaySayfasiState extends State<TarifDetaySayfasi> {
  bool favori = false;
  List<Map<String, dynamic>> yorumlar = []; // yorum + beğeni

  TextEditingController yorumController = TextEditingController();

  void yorumEkle() {
    final yorum = yorumController.text.trim();
    if (yorum.isNotEmpty) {
      setState(() {
        yorumlar.add({'metin': yorum, 'begenildi': false});
        yorumController.clear();
      });
      Navigator.pop(context);
    }
  }

  void yorumSil(int index) {
    setState(() {
      yorumlar.removeAt(index);
    });
  }

  void yorumBegenToggle(int index) {
    setState(() {
      yorumlar[index]['begenildi'] = !yorumlar[index]['begenildi'];
    });
  }

  void yorumDialogAc() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Yorum Ekle"),
        content: TextField(
          controller: yorumController,
          decoration: InputDecoration(hintText: "Yorumunu yaz..."),
          maxLines: 3,
        ),
        actions: [
          TextButton(
            child: Text("İptal"),
            onPressed: () {
              yorumController.clear();
              Navigator.pop(context);
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 188, 144, 230),
              foregroundColor: Colors.white,
            ),
            child: Text("Ekle"),
            onPressed: yorumEkle,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isim),
        backgroundColor: Color.fromARGB(255, 188, 144, 230),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => widget.googleAramaYap(context, widget.isim),
          ),
          IconButton(
            icon: Icon(favori ? Icons.favorite : Icons.favorite_border),
            onPressed: () {
              setState(() {
                favori = !favori;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Malzemeler", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            SizedBox(height: 8),
            Text(widget.malzemeler),
            SizedBox(height: 16),
            Text("Tarif", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            SizedBox(height: 8),
            Text(widget.tarif),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Yorumlar", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                IconButton(
                  icon: Icon(Icons.add_comment),
                  onPressed: yorumDialogAc,
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: yorumlar.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    title: Text(yorumlar[index]['metin']),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(
                            yorumlar[index]['begenildi'] ? Icons.favorite : Icons.favorite_border,
                            color: yorumlar[index]['begenildi'] ? Colors.red : null,
                          ),
                          onPressed: () => yorumBegenToggle(index),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => yorumSil(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}