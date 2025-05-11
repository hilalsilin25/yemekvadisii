import 'package:flutter/material.dart';
import 'package:yemekvadisii/pages/Baklagiller.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Baklagiller', style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepOrange,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 sütunlu kareler
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1, // kare olsun
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
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.deepOrange, width: 2),
              ),
              child: Center(
                child: Text(
                  baklagiller[index]['isim']!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
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

class TarifDetaySayfasi extends StatelessWidget {
  final String isim;
  final String malzemeler;
  final String tarif;

  TarifDetaySayfasi({required this.isim, required this.malzemeler, required this.tarif});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isim, style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Malzemeler',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.deepOrange),
              ),
              SizedBox(height: 10),
              Text(
                malzemeler,
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
              SizedBox(height: 20),
              Text(
                'Tarif',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.deepOrange),
              ),
              SizedBox(height: 10),
              Text(
                tarif,
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }
}