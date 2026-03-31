class Restaurant {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double rating;
  final String location;
  final double pricePerPerson;
  final String cuisine;
  final List<MenuItem> menu;
  final bool isMichelin;

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

class MenuItem {
  final String name;
  final String description;
  final double price;
  final String category;

  MenuItem({
    required this.name,
    required this.description,
    required this.price,
    required this.category,
  });
}
