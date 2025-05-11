import 'package:flutter/material.dart';

class TariflerSayfasi extends StatelessWidget {
  final String corbaAdi;

  TariflerSayfasi({required this.corbaAdi});

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
  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        corbaAdi, // Çorba ismi beyaz renkte olacak
        style: TextStyle(
          color: Colors.white, // Çorba ismi beyaz
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.deepOrange, // Turuncu arka plan
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
                color: Colors.deepOrange, // Kiremit rengi başlık için
                fontFamily: 'Roboto',
              ),
            ),
            Text(
              '\n${tarifler[corbaAdi]?['Malzemeler']}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Colors.black, // İçerik siyah olacak
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Tarif:',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange, // Kiremit rengi başlık için
                fontFamily: 'Roboto',
              ),
            ),
            Text(
              '\n${tarifler[corbaAdi]?['Tarif']}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Colors.black, // İçerik siyah olacak
                fontFamily: 'Roboto',
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}