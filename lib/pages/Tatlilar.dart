import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Tatlilar extends StatefulWidget {
  @override
  _TatlilarState createState() => _TatlilarState();
}

class _TatlilarState extends State<Tatlilar> {
  // Favori durumunu geçici tutalım (uygulama kapanınca sıfırlanacak)
  Set<String> favoriler = {};
  // Yorumları geçici tutalım
  Map<String, List<String>> yorumlar = {};

  // Örnek tatlılar listesi
  final List<Map<String, String>> tatlilar = [
    {
      'isim': 'Baklava',
      'tarif': '''Malzemeler: 
- Yufka (8-10 adet),
- Ceviz içi (isteğe bağlı fındık da kullanabilirsiniz),
- Tereyağı (yaklaşık 200 gram),
- Şeker (2 su bardağı),
- Su (2 su bardağı),
- Limon (1 adet).

Yapılışı: 
1. Yufkaları üst üste serin ve her kata eritilmiş tereyağı sürün.
2. Aralarına ceviz serpin, sonra kalan yufkaları yerleştirin.
3. Son katı da tereyağı ile yağladıktan sonra baklavayı baklava dilimlerinde kesin.
4. Önceden ısıtılmış 180 derece fırında altın rengi olana kadar pişirin.
5. Şerbet için su ve şekeri karıştırarak kaynatın, kaynadıktan sonra limon suyu ekleyin.
6. Fırından çıkan sıcak baklavaya soğuk şerbeti dökün ve biraz dinlendirin.

Kaç kişilik: 8-10 kişilik
Afiyet olsun!'''
    },
    {
      'isim': 'Künefe',
      'tarif': '''Malzemeler:
- Kadayıf (yaklaşık 400 gram),
- Tuzsuz peynir (yaklaşık 300 gram),
- Tereyağı (100 gram),
- Şerbet için: 
  - 2 su bardağı şeker, 
  - 1 su bardağı su,
  - Yarım limon.

Yapılışı:
1. Kadayıfı tereyağıyla iyice harmanlayın ve tepsiye düzgün bir şekilde yayın.
2. Kadayıfın yarısını yerleştirdikten sonra üzerine ince doğranmış tuzsuz peyniri serpiştirin.
3. Peynirin üzerine kalan kadayıfı koyup, kadayıfı iyice bastırarak üzerine kalan tereyağını sürün.
4. Önceden ısıtılmış 180 derece fırında yaklaşık 20-25 dakika kadar pişirin.
5. Pişen künefeyi fırından çıkarın ve üzerine hazırladığınız sıcak şerbeti dökün.
6. Şerbeti iyice çekmesi için birkaç dakika bekledikten sonra, sıcak sıcak servis yapın.

Kaç kişilik: 4-6 kişilik
Afiyet olsun!'''
    },
    {
      'isim': 'Sütlaç',
      'tarif': '''Malzemeler:
- 1 litre süt,
- 1 çay bardağı pirinç,
- 1 su bardağı şeker,
- 1 yemek kaşığı nişasta.

Yapılışı:
1. Pirinci yıkayıp, bir tencereye alıp üzerine 3 su bardağı su ekleyerek kaynatın.
2. Pirinçler yumuşadıktan sonra üzerine sütü ilave edin ve karıştırarak kaynamaya bırakın.
3. Şeker ve nişastayı ekleyin, sürekli karıştırarak kıvam almasını sağlayın.
4. Karışım kaynamaya başladığında ocağın altını kısın ve 10-15 dakika pişirin.
5. Karışım koyulaştığında ocaktan alın ve kaselere dökün.
6. Sütlaçları soğuduktan sonra üzerine tarçın serpip soğuk olarak servis yapın.

Kaç kişilik: 6-8 kişilik
Afiyet olsun!'''
    },
    {
      'isim': 'Kazandibi',
      'tarif': '''Malzemeler:
- 1 litre süt,
- 1 su bardağı şeker,
- 3 yemek kaşığı pirinç unu,
- 1 yemek kaşığı nişasta,
- 2 yemek kaşığı tereyağı.

Yapılışı:
1. Sütü, şeker, pirinç unu ve nişastayı bir tencereye alıp karıştırın.
2. Orta ateşte sürekli karıştırarak koyulaşmasını sağlayın.
3. Karışım koyulaştığında tereyağını ekleyin ve 1-2 dakika karıştırarak pişirmeye devam edin.
4. Karışımı geniş bir tepsiye dökün ve üzerini düzgünce yayın.
5. Tepsiyi soğumaya bırakın, sonra altını yakarak karamelleştirin.
6. Kazandibi soğuduktan sonra dilimleyip servis yapabilirsiniz.

Kaç kişilik: 8-10 kişilik
Afiyet olsun!'''
    },
    {
      'isim': 'İrmik Helvası',
      'tarif': '''Malzemeler:
- 1 su bardağı irmik,
- 1 su bardağı şeker,
- 2 yemek kaşığı tereyağı,
- 1 su bardağı süt,
- 1 su bardağı su,
- Çam fıstığı (isteğe bağlı).

Yapılışı:
1. İrmiği tereyağında kısık ateşte rengi dönene kadar kavurun.
2. Ayrı bir kasede süt ve suyu karıştırın ve sıcak hale getirin.
3. Sıcak süt-su karışımını irmiğe ekleyin ve karıştırarak çekmesini bekleyin.
4. İrmik helvası kıvama geldiğinde üzerine şeker ekleyip karıştırın.
5. Sıcak olarak servis yapın, üzerine isteğe göre çam fıstığı serpebilirsiniz.

Kaç kişilik: 6-8 kişilik
Afiyet olsun!'''
    },
    {
      'isim': 'Kadayıf Dolması',
      'tarif': '''Malzemeler:
- Tel kadayıf (yaklaşık 400 gram),
- Ceviz içi (isteğe bağlı fındık da kullanılabilir),
- 1 adet yumurta,
- Şerbet (şeker ve su),
- Sıvı yağ (kızartma için).

Yapılışı:
1. Tel kadayıfı düz bir zemine serin ve içine bol miktarda ceviz koyun.
2. Kadayıfı rulo şeklinde sarın ve üzerine çırpılmış yumurtaya bulayın.
3. Kızgın yağda nar gibi kızartın, altın rengini alınca çıkarın.
4. Kızaran kadayıf dolmalarını hemen soğuk şerbete batırın.
5. Şerbeti iyice çekmesi için 5-10 dakika bekledikten sonra sıcak sıcak servis yapın.

Kaç kişilik: 4-6 kişilik
Afiyet olsun!'''
    },
    {
      'isim': 'Soğuk Baklava',
      'tarif': '''Malzemeler:
- 1 paket baklava yufkası,
- 200 gram ceviz içi,
- 200 gram tereyağı,
- 2 su bardağı su,
- 1.5 su bardağı şeker,
- 1 çay kaşığı limon suyu.

Yapılışı:
1. Baklava yufkalarını tepsiye dizin ve her kat arasına eritilmiş tereyağı sürün.
2. Cevizleri yufkaların arasına yerleştirin ve baklava dilimlerini kesin.
3. Önceden ısıtılmış 180 derece fırında altın rengi olana kadar pişirin.
4. Şerbet için şeker ve suyu kaynatın, kaynadıktan sonra limon suyu ekleyin.
5. Fırından çıkan sıcak baklavaya soğuk şerbeti dökün.
6. Şerbeti çekmesi için 1-2 saat bekledikten sonra soğuk olarak servis yapın.

Kaç kişilik: 8-10 kişilik
Afiyet olsun!'''
    },
    {
      'isim': 'Lotus',
      'tarif': '''Malzemeler:
- 200 gram bisküvi (Lotus bisküvi kullanabilirsiniz),
- 1 paket krem şanti,
- 1 su bardağı süt,
- 100 gram bitter çikolata,
- 1 su bardağı süt kreması.

Yapılışı:
1. Bisküvileri kırın ve bir kaba alın.
2. Krem şantiyi sütle çırpın, ardından bisküvilerle karıştırın.
3. Çikolatayı benmari usulü eritin, sonra süt kremasıyla karıştırarak bir karışım hazırlayın.
4. Bisküvi karışımını kalıba dökün, üzerine çikolata karışımını yayın.
5. Buzdolabında 3-4 saat bekletin.
6. Soğuduktan sonra dilimleyip servis yapın.

Kaç kişilik: 6-8 kişilik
Afiyet olsun!'''
    },
    {
      'isim': 'Brownie Kurabiye',
      'tarif': '''Malzemeler:
- 100 gram tereyağı,
- 1 su bardağı şeker,
- 2 adet yumurta,
- 1 paket vanilin,
- 1 su bardağı un,
- 2 yemek kaşığı kakao,
- Yarım su bardağı damla çikolata.

Yapılışı:
1. Tereyağını eritin ve şekerle karıştırarak çırpın.
2. Yumurtaları ekleyip çırpmaya devam edin, vanilin ve kakao ekleyin.
3. Unu azar azar ilave edin ve karıştırın.
4. Damla çikolatayı ekleyin, hamuru karıştırarak küçük yuvarlaklar yapın.
5. 180 derece fırında 15-20 dakika pişirin.
6. Fırından çıkarıp soğuduktan sonra servis yapın.

Kaç kişilik: 10 kişilik
Afiyet olsun!'''
    },
    {
      'isim': 'Islak Kek',
      'tarif': '''Malzemeler:
- 1 su bardağı şeker,
- 1 su bardağı süt,
- 1 çay bardağı sıvı yağ,
- 2 adet yumurta,
- 1 paket kabartma tozu,
- 1 paket vanilin,
- 1 su bardağı kakao,
- 2 su bardağı un.

Yapılışı:
1. Yumurtaları çırpın, şekerle birlikte karıştırın.
2. Süt ve sıvı yağı ekleyip karıştırın, sonra kakao, vanilin ve kabartma tozunu ilave edin.
3. Unu ekleyin ve karıştırarak pürüzsüz bir hamur elde edin.
4. Önceden ısıtılmış 180 derece fırında 25-30 dakika pişirin.
5. Kek piştikten sonra üzerine şerbetini dökün ve soğumaya bırakın.

Kaç kişilik: 8-10 kişilik
Afiyet olsun!'''
 },
    {
        'isim': 'Revani',
      'tarif': '''Malzemeler:
- 2 adet yumurta,
- 1 su bardağı şeker,
- Yarım su bardağı yoğurt,
- 1 çay bardağı sıvı yağ,
- 1 paket kabartma tozu,
- 1 paket vanilin,
- 1,5 su bardağı irmik,
- 1 su bardağı un,
- 1 su bardağı süt (şerbet için),
- 2 su bardağı su (şerbet için),
- 2 su bardağı şeker (şerbet için),
- Birkaç damla limon suyu (şerbet için).

Yapılışı:
1. Yumurtaları çırpın, şekerle birlikte köpürene kadar çırpmaya devam edin.
2. Yoğurdu, sıvı yağı ve vanilini ekleyin, karıştırın.
3. Un, irmik, kabartma tozu ve vanilini de ekleyip karıştırarak akışkan bir hamur elde edin.
4. Hamuru yağlanmış tepsiye dökün ve 180 derecede yaklaşık 30-35 dakika pişirin.
5. Şerbeti hazırlamak için, su, şeker ve limon suyunu kaynatın.
6. Fırından çıkan sıcak revaniye sıcak şerbeti dökün ve şerbeti çekmesini bekleyin.

Kaç kişilik: 6-8 kişilik
Afiyet olsun!'''
    },
    {
      'isim': 'Fırın Sütlaç',
      'tarif': '''Malzemeler:
- 1 litre süt,
- 1 çay bardağı pirinç,
- 1 su bardağı şeker,
- 1 paket vanilin,
- 2 yemek kaşığı nişasta,
- 1 adet yumurta.

Yapılışı:
1. Pirinci yıkayıp, 3 su bardağı suyla pişirin.
2. Pirinçler iyice yumuşadıktan sonra sütü ekleyin ve karıştırarak kaynatın.
3. Şeker ve vanilini de ekleyin, karıştırarak pişirmeye devam edin.
4. Yumurta ve nişastayı karıştırıp sütle olan karışıma ekleyin ve karıştırarak koyulaştırın.
5. Hazırladığınız karışımı fırın kabına dökün, 170 derecede yaklaşık 20-25 dakika pişirin.
6. Pişen sütlacı fırından çıkarın ve soğumaya bırakın.

Kaç kişilik: 6-8 kişilik
Afiyet olsun!'''
    },
    {
      'isim': 'Çikolatalı Mousse',
      'tarif': '''Malzemeler:
- 200 gram bitter çikolata,
- 1 paket krema,
- 3 yemek kaşığı şeker,
- 1 tatlı kaşığı vanilin.

Yapılışı:
1. Çikolatayı benmari usulü eritin.
2. Kremayı bir kaba dökün ve şekerle çırpın, karışım koyulaşınca vanilini ekleyin.
3. Çikolata ve kremayı karıştırarak pürüzsüz bir kıvam elde edin.
4. Mousse karışımını bardaklara dökün ve buzdolabında en az 3 saat soğutun.
5. Üzerine dilediğiniz meyvelerle süsleyerek soğuk olarak servis yapın.

Kaç kişilik: 4-6 kişilik
Afiyet olsun!'''
    },
    {
      'isim': 'Karpuzlu Tatlı',
      'tarif': '''Malzemeler:
- 1 dilim karpuz,
- 1 paket krem şanti,
- 1 su bardağı süt,
- Yarım su bardağı yoğurt,
- 1 tatlı kaşığı bal.

Yapılışı:
1. Karpuzu küp küp doğrayın ve blenderdan geçirin.
2. Krem şantiyi sütle çırpın, yoğurdu ve balı ekleyin, karıştırın.
3. Karpuz püresini ekleyip karıştırarak pürüzsüz bir kıvam elde edin.
4. Karışımı bardaklara dökün ve buzdolabında 1-2 saat soğutun.
5. Üzerine taze nane veya meyve ile süsleyerek soğuk servis yapın.

Kaç kişilik: 4 kişilik
Afiyet olsun!'''
    },
    {
      'isim': 'Kremalı Elmalı Tatlı',
      'tarif': '''Malzemeler:
- 2 adet elma,
- 1 paket krema,
- 3 yemek kaşığı şeker,
- 1 tatlı kaşığı tarçın,
- Yarım su bardağı su,
- 1 yemek kaşığı tereyağı.

Yapılışı:
1. Elmaları soyup dilimleyin ve tavada tereyağında yumuşayana kadar pişirin.
2. Şeker ve tarçını ekleyip karıştırın.
3. Krema ve suyu ekleyip karıştırarak kaynamaya bırakın.
4. Karışım koyulaşınca ocaktan alın ve 5 dakika soğumaya bırakın.
5. Soğuduktan sonra servis kaselerine dökün ve üzerine ceviz serpiştirerek sıcak servis yapın.

Kaç kişilik: 4-6 kişilik
Afiyet olsun!'''
    },
    {
      'isim': 'Bisküvili Pasta',
      'tarif': '''Malzemeler:
- 2 paket petibör bisküvi,
- 1 paket krem şanti,
- 1 litre süt,
- 1 su bardağı şeker,
- 1 yemek kaşığı vanilin.

Yapılışı:
1. Sütü, şeker ve vanilinle kaynatın.
2. Krem şantiyi çırpın ve kaynayan süte ekleyin.
3. Bir tepsiye bisküvileri dizin ve üzerine hazırladığınız karışımı dökün.
4. Üstüne bir kat daha bisküvi yerleştirip, kalan karışımı dökün.
5. Soğumaya bırakın, ardından dilimleyip soğuk servis yapın.

Kaç kişilik: 6-8 kişilik
Afiyet olsun!'''
    },
    {
      'isim': 'Meyveli Tart',
      'tarif': '''Malzemeler:
- 1 paket tart hamuru,
- 200 gram krem peynir,
- 1 paket vanilin,
- 2 yemek kaşığı şeker,
- Karışık meyveler (çilek, muz, kivi vb.).

Yapılışı:
1. Tart hamurunu tepsiye serin ve 180 derece fırında 15-20 dakika pişirin.
2. Krem peyniri, vanilini ve şekeri karıştırarak pürüzsüz bir krem elde edin.
3. Pişen tart hamurunun üzerine kremayı yayın.
4. Üzerini taze meyvelerle süsleyip soğumaya bırakın.
5. Soğuduktan sonra dilimleyerek servis yapın.

Kaç kişilik: 6 kişilik
Afiyet olsun!'''
    },
    {
      'isim': 'Şambali',
      'tarif': '''Malzemeler:
- 1 su bardağı irmik,
- 1 su bardağı şeker,
- 1 su bardağı yoğurt,
- 1 paket kabartma tozu,
- 1 paket vanilin,
- 1 su bardağı su (şerbet için),
- 1,5 su bardağı şeker (şerbet için).

Yapılışı:
1. Yoğurdu, şeker ve irmiği karıştırıp üzerine kabartma tozu ve vanilini ekleyin.
2. Karışımdan akışkan bir hamur elde edin ve yağlanmış tepsiye dökün.
3. 180 derece fırında 25-30 dakika kadar pişirin.
4. Şerbeti hazırlayın, şeker ve suyu kaynatın, kaynadıktan sonra biraz limon ekleyin.
5. Fırından çıkan sıcak şambaliye sıcak şerbeti dökün ve iyice çekmesini bekleyin.

Kaç kişilik: 6-8 kişilik
Afiyet olsun!'''
    },
    {
      'isim': 'Fırında Çikolatalı Muhallebi',
      'tarif': '''Malzemeler:
- 1 litre süt,
- 2 yemek kaşığı kakao,
- 1 su bardağı şeker,
- 3 yemek kaşığı nişasta,
- 1 paket vanilin,
- 1 tatlı kaşığı tereyağı.

Yapılışı:
1. Sütü, şeker ve kakao ile kaynatın.
2. Nişastayı suda açın ve karışıma ekleyin, koyulaşana kadar pişirin.
3. Vanilini ve tereyağını ekleyin, karıştırın.
4. Karışımı fırın kabına dökün ve 180 derecede 15-20 dakika pişirin.
5. Fırından çıkan tatlıyı soğumaya bırakın ve soğuk servis yapın.

Kaç kişilik: 6 kişilik
Afiyet olsun!'''
    },
  ];
    void toggleFavori(String isim) {
    setState(() {
      if (favoriler.contains(isim)) {
        favoriler.remove(isim);
      } else {
        favoriler.add(isim);
      }
    });
  }

  void yorumEkle(String isim, String yorum) {
    setState(() {
      yorumlar.putIfAbsent(isim, () => []);
      yorumlar[isim]!.add(yorum);
    });
  }

  void detayDialog(BuildContext context, int index) {
    String isim = tatlilar[index]['isim']!;
    String tarif = tatlilar[index]['tarif']!;
    TextEditingController yorumController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setStateDialog) => AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isim,
                style: TextStyle(color: Colors.purple[900], fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(Icons.search, color: Colors.blue),
                onPressed: () async {
                  final query = Uri.encodeComponent('$isim tarifi');
                  final url = Uri.parse('https://www.google.com/search?q=$query');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Google araması açılamadı')),
                    );
                  }
                },
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tarif, style: TextStyle(fontSize: 16)),
                SizedBox(height: 20),
                Text('Yorumlar:', style: TextStyle(fontWeight: FontWeight.bold)),
                ...?yorumlar[isim]?.map((y) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text('- $y')),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setStateDialog(() {
                                yorumlar[isim]!.remove(y);
                              });
                            },
                          ),
                        ],
                      ),
                    )),
                TextField(
                  controller: yorumController,
                  decoration: InputDecoration(
                    labelText: 'Yorum ekle',
                    border: OutlineInputBorder(),
                  ),
                  minLines: 1,
                  maxLines: 3,
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (yorumController.text.trim().isNotEmpty) {
                      yorumEkle(isim, yorumController.text.trim());
                      yorumController.clear();
                      setStateDialog(() {});
                    }
                  },
                  child: Text('Yorum Ekle'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Kapat', style: TextStyle(color: Colors.purple[900])),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tatlılar'),
        backgroundColor: const Color.fromARGB(255, 188, 144, 230),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: TatliSearchDelegate(tatlilar, favoriler, yorumlar, toggleFavori, yorumEkle),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.public),
            onPressed: () async {
              final Uri googleUrl = Uri.parse('https://www.google.com/search?q=tatli+tarifleri');
              if (await canLaunchUrl(googleUrl)) {
                await launchUrl(googleUrl);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Google açılamadı paşam.')),
                );
              }
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                Color backgroundColor = Colors.grey.shade200;
                String isim = tatlilar[index]['isim']!;
                bool isFavori = favoriler.contains(isim);
                return Card(
                  margin: EdgeInsets.all(8),
                  elevation: 4,
                  color: backgroundColor,
                  child: ListTile(
                    leading: Icon(
                      Icons.cake,
                      color: const Color.fromARGB(255, 98, 19, 113),
                    ),
                    title: Text(
                      isim,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        isFavori ? Icons.favorite : Icons.favorite_border,
                        color: isFavori ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {
                        toggleFavori(isim);
                      },
                    ),
                    onTap: () => detayDialog(context, index),
                  ),
                );
              },
              childCount: tatlilar.length,
            ),
          ),
        ],
      ),
    );
  }
}

class TatliSearchDelegate extends SearchDelegate {
  final List<Map<String, String>> tatlilar;
  final Set<String> favoriler;
  final Map<String, List<String>> yorumlar;
  final Function(String) toggleFavori;
  final Function(String, String) yorumEkle;

  TatliSearchDelegate(this.tatlilar, this.favoriler, this.yorumlar, this.toggleFavori, this.yorumEkle);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  void detayDialog(BuildContext context, int index) {
    String isim = tatlilar[index]['isim']!;
    String tarif = tatlilar[index]['tarif']!;
    TextEditingController yorumController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setStateDialog) => AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isim,
                style: TextStyle(color: Colors.purple[900], fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(Icons.search, color: Colors.blue),
                onPressed: () async {
                  final query = Uri.encodeComponent('$isim tarifi');
                  final url = Uri.parse('https://www.google.com/search?q=$query');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Google araması açılamadı')),
                    );
                  }
                },
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tarif, style: TextStyle(fontSize: 16)),
                SizedBox(height: 20),
                Text('Yorumlar:', style: TextStyle(fontWeight: FontWeight.bold)),
                ...?yorumlar[isim]?.map((y) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text('- $y'),
                    )),
                TextField(
                  controller: yorumController,
                  decoration: InputDecoration(
                    labelText: 'Yorum ekle',
                    border: OutlineInputBorder(),
                  ),
                  minLines: 1,
                  maxLines: 3,
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (yorumController.text.trim().isNotEmpty) {
                      yorumEkle(isim, yorumController.text.trim());
                      yorumController.clear();
                      setStateDialog(() {});
                    }
                  },
                  child: Text('Yorum Ekle'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Kapat', style: TextStyle(color: Colors.purple[900])),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = tatlilar
        .where((tatli) => tatli['isim']!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView(
      children: results.map((tatli) {
        int index = tatlilar.indexOf(tatli);
        return ListTile(
          title: Text(tatli['isim']!),
          onTap: () {
            detayDialog(context, index);
          },
        );
      }).toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = tatlilar
        .where((tatli) => tatli['isim']!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView(
      children: suggestions.map((tatli) {
        int index = tatlilar.indexOf(tatli);
        return ListTile(
          title: Text(tatli['isim']!),
          onTap: () {
            query = tatli['isim']!;
            showResults(context);
          },
        );
      }).toList(),
    );
  }
}
 
 