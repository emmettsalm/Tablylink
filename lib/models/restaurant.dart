// โมเดลข้อมูลร้านอาหาร เก็บรายละเอียดร้านอาหารทั้งหมด
class Restaurant {
  final String id; // รหัสร้านอาหาร
  final String name; // ชื่อร้าน
  final String description; // คำอธิบายร้าน
  final String imageUrl; // รูปภาพร้าน
  final double rating; // คะแนนรีวิว (1.0 - 5.0)
  final String location; // ที่ตั้งร้าน
  final double pricePerPerson; // ราคาต่อคน (บาท)
  final String cuisine; // ประเภทอาหาร เช่น French, Japanese, Thai
  final List<MenuItem> menu; // รายการเมนูอาหาร
  final bool isMichelin; // เป็นร้านมิชลินหรือไม่

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.location,
    required this.pricePerPerson,
    required this.cuisine,
    required this.menu,
    this.isMichelin = false,
  });
}

// โมเดลข้อมูลเมนูอาหาร แต่ละรายการในร้านอาหาร
class MenuItem {
  final String name; // ชื่อเมนู
  final String description; // คำอธิบายเมนู
  final double price; // ราคา (บาท)
  final String category; // หมวดหมู่ เช่น มื้อกลางวัน, จานหลัก, ของหวาน

  MenuItem({
    required this.name,
    required this.description,
    required this.price,
    required this.category,
  });
}
