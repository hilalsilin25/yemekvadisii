import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TariflerSayfasi extends StatefulWidget {
  final String corbaAdi;

  TariflerSayfasi({required this.corbaAdi});

  @override
  _TariflerSayfasiState createState() => _TariflerSayfasiState();
}

class _TariflerSayfasiState extends State<TariflerSayfasi> {
  final TextEditingController yorumController = TextEditingController();

  // Yorumlar: her yorum bir metin ve beğeni durumu içerir
  List<_Yorum> yorumlar = [];

  final Map<String, Map<String, String>> tarifler = {
  'Mercimek Çorbası': {
  'Malzemeler': '''
- 1 su bardağı mercimek
- 1 adet soğan (doğranmış)
- 1 adet havuç (rendelenmiş)
- 1 çay bardağı zeytinyağı
- 1 tatlı kaşığı tuz
- 1 çay kaşığı karabiber
- 1 tatlı kaşığı kimyon
- 6 su bardağı su
  ''',
  'Tarif': '''
1. Soğanı doğrayın ve zeytinyağında pembeleşene kadar kavurun.
2. Havuç ve mercimekleri ekleyip birkaç dakika daha kavurun.
3. Su ve baharatları ekleyin, kaynadıktan sonra kısık ateşte mercimekler yumuşayana kadar pişirin.
4. Çorbayı blenderdan geçirin ve sıcak servis yapın.
  '''
},

'Tarator Çorbası': {
  'Malzemeler': '''
- 1 su bardağı yoğurt
- 1/2 su bardağı su
- 1 tatlı kaşığı zeytinyağı
- 1 diş sarımsak (ezilmiş)
- 1 tatlı kaşığı tuz
- 1/2 tatlı kaşığı karabiber
- 1/2 su bardağı ince doğranmış dereotu
- 1 tatlı kaşığı sirke
  ''',
  'Tarif': '''
1. Yoğurdu ve suyu bir kaba alıp karıştırın.
2. Sarımsak, zeytinyağı, sirke, tuz ve baharatları ekleyin.
3. Dereotunu ekleyip karıştırın.
4. Soğuk servis yapın.
Afiyet Olsun :))
  '''
},

'Yoğurtlu Çorba': {
  'Malzemeler': '''
- 1 su bardağı yoğurt
- 1 su bardağı su
- 2 yemek kaşığı un
- 1 tatlı kaşığı tuz
- 1 yemek kaşığı zeytinyağı
- 1 diş sarımsak (ezilmiş)
- Nane (isteğe bağlı)
  ''',
  'Tarif': '''
1. Unu zeytinyağında kavurun.
2. Yoğurdu su ile çırpın ve karışıma ekleyin.
3. Sarımsak, tuz ve naneyi ekleyin.
4. Karışımı kaynatıp, sıcak servis yapın.
Afiyet Olsun!
  '''
},

'Beyran Çorbası': {
  'Malzemeler': '''
- 300 gram kuzu eti
- 1 adet soğan
- 2 diş sarımsak
- 1 tatlı kaşığı pul biber
- 1 çay kaşığı kararbiber
- 1 tatlı kaşığı tuz
- 2 su bardağı su
- 2 yemek kaşığı tereyağı
  ''',
  'Tarif': '''
1. Eti doğrayıp tencereye koyun.
2. Soğan ve sarımsağı ekleyip kavurun.
3. Suyu ve baharatları ekleyin, pişmeye bırakın.
4. Çorba kaynadıktan sonra tereyağını ekleyip karıştırın.
5. Sıcak servis yapın.
Afiyet Olsunnn
  '''
},

'Kesme Aşı Çorbası': {
  'Malzemeler': '''
- 1 su bardağı yoğurt
- 1 su bardağı su
- 1 yemek kaşığı un
- 1 tatlı kaşığı tuz
- 1 yemek kaşığı zeytinyağı
- 1 diş sarımsak (ezilmiş)
- Nane (isteğe bağlı)
  ''',
  'Tarif': '''
1. Unu zeytinyağında kavurun.
2. Yoğurdu su ile çırpın ve karışıma ekleyin.
3. Sarımsak, tuz ve naneyi ekleyin.
4. Karışımı kaynatıp, sıcak servis yapın.
Erzurum soğuğunda iyi gider :))
  '''
},

'Kısır Çorbası': {
  'Malzemeler': '''
- 1 su bardağı ince bulgur
- 1 tatlı kaşığı tuz
- 1 tatlı kaşığı pul biber
- 2 yemek kaşığı zeytinyağı
- 1/2 su bardağı limon suyu
- 1 tatlı kaşığı nar ekşisi
- 1/2 çay bardağı su
  ''',
  'Tarif': '''
1. Bulguru sıcak suyla ıslatıp 15 dakika bekletin.
2. Zeytinyağını, limon suyunu ve nar ekşisini ekleyin.
3. Baharatları ekleyip karıştırın.
4. Buz dolabında soğutun, sonra soğuk servis yapın.
  '''
},
'Domates Çorbası': {
  'Malzemeler': '''
- 4 adet domates (rendelenmiş)
- 1 adet soğan (doğranmış)
- 1 yemek kaşığı zeytinyağı
- 1 tatlı kaşığı tuz
- 1 çay kaşığı karabiber
- 4 su bardağı su
  ''',
  'Tarif': '''
1. Soğanı zeytinyağında kavurun.
2. Rendelenmiş domatesleri ekleyip 10 dakika pişirin.
3. Suyu ve baharatları ekleyin, kaynamaya bırakın.
4. Çorbayı blenderdan geçirin ve sıcak servis yapın.
  '''
},

'Tavuk Çorbası': {
  'Malzemeler': '''
- 1 adet tavuk göğsü
- 1 adet havuç (doğranmış)
- 1 adet patates (doğranmış)
- 1 adet soğan
- 1 tatlı kaşığı tuz
- 1 çay kaşığı karabiber
- 6 su bardağı su
  ''',
  'Tarif': '''
1. Tavuk göğsünü haşlayın, suyunu saklayın.
2. Havuç, patates ve soğanı kaynayan suya ekleyin.
3. Tavuk etini didikleyip çorbaya ekleyin.
4. Baharatları da ekleyip, pişirmeye devam edin.
5. Sıcak servis yapın.
  '''
},

'Ezo Gelin Çorbası': {
  'Malzemeler': '''
- 1 su bardağı kırmızı mercimek
- 1 su bardağı pilavlık bulgur
- 1 adet soğan
- 1 yemek kaşığı salça
- 1 tatlı kaşığı tuz
- 1 tatlı kaşığı pul biber
- 1 çay kaşığı karabiber
- 6 su bardağı su
  ''',
  'Tarif': '''
1. Soğanı doğrayın ve salçayla birlikte kavurun.
2. Mercimek ve bulguru ekleyip birkaç dakika kavurun.
3. Suyu ve baharatları ekleyin, kaynadıktan sonra kısık ateşte pişirin.
4. Blenderdan geçirin ve sıcak servis yapın.
  '''
},

'Sebze Çorbası': {
  'Malzemeler': '''
- 1 adet kabak
- 1 adet patates
- 1 adet havuç
- 1 adet soğan
- 6 su bardağı su
- 1 tatlı kaşığı tuz
- 1 çay kaşığı karabiber
  ''',
  'Tarif': '''
1. Sebzeleri doğrayın.
2. Tüm malzemeleri tencereye koyun ve kaynamaya bırakın.
3. Sebzeler yumuşayınca çorbayı blenderdan geçirin.
4. Sıcak servis yapın.
Afiyet Olsun efendimmm
  '''
},

'Brokoli Çorbası': {
  'Malzemeler': '''
- 1 adet brokoli
- 1 adet patates (doğranmış)
- 1 adet havuç (doğranmış)
- 1 yemek kaşığı tereyağı
- 1 tatlı kaşığı tuz
- 1 çay kaşığı karabiber
- 6 su bardağı su
  ''',
  'Tarif': '''
1. Brokoli, patates ve havuçları kaynamış suya ekleyin.
2. Sebzeler yumuşayınca tereyağını ekleyip karıştırın.
3. Çorbayı blenderdan geçirin.
4. Tuz ve karabiberi ekleyin, sıcak servis yapın.
  '''
},

'Şehriye Çorbası': {
  'Malzemeler': '''
- 1/2 su bardağı arpa şehriye
- 1 adet havuç (doğranmış)
- 1 tatlı kaşığı tuz
- 1 tatlı kaşığı pul biber
- 1 yemek kaşığı zeytinyağı
- 6 su bardağı su
  ''',
  'Tarif': '''
1. Şehriyeleri ve doğranmış havuçları zeytinyağında biraz kavurun.
2. Suyu ekleyip kaynamaya bırakın.
3. Baharatları ekleyip kaynamaya devam edin.
4. Çorba kıvamını alınca sıcak servis yapın.
  '''
},

'Köfteli Çorba': {
  'Malzemeler': '''
- 200 gram kıyma
- 1/2 su bardağı ince bulgur
- 1 adet soğan (doğranmış)
- 1 tatlı kaşığı tuz
- 1 çay kaşığı karabiber
- 1 yemek kaşığı zeytinyağı
- 6 su bardağı su
  ''',
  'Tarif': '''
1. Kıymayı, bulguru, tuzu ve baharatları karıştırarak köfte harcı yapın.
2. Küçük köfteler şekil verin.
3. Şehriye ve suyu kaynatın, köfteleri ekleyin.
4. 10 dakika kadar pişirin ve sıcak servis yapın.
  '''
},

'Mantarlı Çorba': {
  'Malzemeler': '''
- 200 gram mantar (doğranmış)
- 1 adet soğan (doğranmış)
- 1 tatlı kaşığı tuz
- 1 çay kaşığı karabiber
- 1 yemek kaşığı tereyağı
- 6 su bardağı su
  ''',
  'Tarif': '''
1. Soğanı tereyağında kavurun.
2. Mantarları ekleyip birkaç dakika kavurun.
3. Suyu ekleyip kaynamaya bırakın.
4. Çorba kaynadıktan sonra blenderdan geçirin.
5. Sıcak servis yapın.
  '''
},

'Çılbır Çorbası': {
  'Malzemeler': '''
- 2 adet yumurta
- 1 tatlı kaşığı tuz
- 1 yemek kaşığı sirke
- 1 yemek kaşığı tereyağı
- 6 su bardağı su
  ''',
  'Tarif': '''
1. Suyu kaynatıp sirke ve tuzu ekleyin.
2. Yumurtaları kaynar suya dikkatlice kırın.
3. Yumuşak haşlanmış yumurtaları çorbanın içine koyun.
4. Tereyağını eritip üzerine dökün, sıcak servis yapın.
  '''
},
  };
   void googleAramaYap(String kelime) async {
    final url = 'https://www.google.com/search?q=${Uri.encodeComponent(kelime)}';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  void yorumEkle() {
    final yorum = yorumController.text.trim();
    if (yorum.isNotEmpty) {
      setState(() {
        yorumlar.add(_Yorum(text: yorum));
        yorumController.clear();
      });
    }
  }

  void yorumSil(int index) {
    setState(() {
      yorumlar.removeAt(index);
    });
  }

  void yorumBegeniDegistir(int index) {
    setState(() {
      yorumlar[index].begeni = !yorumlar[index].begeni;
    });
  }

  @override
  Widget build(BuildContext context) {
    final corbaAdi = widget.corbaAdi;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          corbaAdi,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 188, 144, 230),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () => googleAramaYap("$corbaAdi tarifi"),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Malzemeler:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 92, 58, 120),
                  fontFamily: 'Roboto',
                ),
              ),
              Text(
                '\n${tarifler[corbaAdi]?['Malzemeler'] ?? 'Veri yok'}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: 'Roboto',
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Tarif:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 92, 58, 120),
                  fontFamily: 'Roboto',
                ),
              ),
              Text(
                '\n${tarifler[corbaAdi]?['Tarif'] ?? 'Veri yok'}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: 'Roboto',
                ),
              ),
              SizedBox(height: 30),
              Divider(thickness: 1.5),
              Text(
                'Yorum Ekle:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple[800],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: yorumController,
                      decoration: InputDecoration(hintText: "Yorumunuzu yazın..."),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send, color: Colors.purple[800]),
                    onPressed: yorumEkle,
                  )
                ],
              ),
              if (yorumlar.isNotEmpty) ...[
                SizedBox(height: 20),
                Text(
                  'Yorumlar:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: yorumlar.length,
                  itemBuilder: (context, index) {
                    final yorum = yorumlar[index];
                    return ListTile(
                      leading: IconButton(
                        icon: Icon(
                          yorum.begeni ? Icons.favorite : Icons.favorite_border,
                          color: yorum.begeni ? Colors.red : Colors.grey,
                        ),
                        onPressed: () => yorumBegeniDegistir(index),
                      ),
                      title: Text(yorum.text),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.grey),
                        onPressed: () => yorumSil(index),
                      ),
                    );
                  },
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class _Yorum {
  final String text;
  bool begeni;

  _Yorum({required this.text, this.begeni = false});
}
