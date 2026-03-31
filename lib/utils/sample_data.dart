import 'package:tablylink/models/restaurant.dart';

class SampleData {
  static List<Restaurant> get michelinRestaurants =>
      [
        Restaurant(
          id: '1',
          name: 'เลอ นอร์มังดี',
          description:
          'อาหารฝรั่งเศสระดับรางวัลพร้อมวิวแม่น้ำที่สวยงาม สัมผัสประสบการณ์อาหารชั้นเลิศที่ดีที่สุด',
          imageUrl: 'michelin_1',
          rating: 4.9,
          location: 'ริเวอร์ไซด์, กรุงเทพฯ',
          pricePerPerson: 3500,
          cuisine: 'French',
          isMichelin: true,
          menu: [
            MenuItem(
                name: 'ฟัวกราส์ เทอร์รีน',
                description: 'เสิร์ฟพร้อมแยมมะเดื่อและขนมปังบริโอช',
                price: 890,
                category: 'มื้อกลางวัน'),
            MenuItem(
                name: 'ล็อบสเตอร์ เทอร์มิดอร์',
                description: 'สูตรฝรั่งเศสคลาสสิกกับชีสกรูแยร์',
                price: 1890,
                category: 'จานหลัก'),
            MenuItem(
                name: 'เครม บรูเล่',
                description: 'คัสตาร์ดวานิลลามาดากัสการ์',
                price: 450,
                category: 'ของหวาน'),
            MenuItem(
                name: 'วากิวบีฟ ทาร์ทาร์',
                description: 'เนื้อวากิว A5 จากญี่ปุ่นกับทรัฟเฟิล',
                price: 1290,
                category: 'อะลาคาร์ต'),
          ],
        ),
        Restaurant(
          id: '2',
          name: 'กากัน อานันท์',
          description:
          'อาหารอินเดียสมัยใหม่ที่ผลักดันขอบเขตการทำอาหารด้วยเทคนิคที่สร้างสรรค์',
          imageUrl: 'michelin_2',
          rating: 4.8,
          location: 'ลุมพินี, กรุงเทพฯ',
          pricePerPerson: 4200,
          cuisine: 'Indian',
          isMichelin: true,
          menu: [
            MenuItem(
                name: 'โยเกิร์ต เอ็กซ์โพลชั่น',
                description: 'ซิกเนเจอร์ทรงกลมโมเลกุล',
                price: 590,
                category: 'มื้อกลางวัน'),
            MenuItem(
                name: 'ซี่โครงแกะย่างถ่าน',
                description: 'เสิร์ฟพร้อมมินต์ชัทนีย์และไรตา',
                price: 1590,
                category: 'จานหลัก'),
            MenuItem(
                name: 'ข้าวเหนียวมะม่วง รีอิแมจิน',
                description: 'ฟิวชั่นไทย-อินเดียสไตล์ดีคอนสตรัคชั่น',
                price: 490,
                category: 'ของหวาน'),
          ],
        ),
      ];

}
