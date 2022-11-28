class Product {
  String id;
  String name;
  List<String> imgs;
  String category;
  String seller;
  String? description;
  double latitude;
  double longitude;
  double price;

  Product(
      {required this.id,
      required this.name,
      required this.imgs,
      required this.description,
      required this.category,
      required this.seller,
      required this.latitude,
      required this.longitude,
      required this.price});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json["id"],
        name: json["name"],
        description: json['description'] ?? '',
        imgs: json['imgs'],
        price: json['price'],
        category: json['category'],
        seller: json['seller'],
        latitude: json['latitude'],
        longitude: json['longitude']);
  }

  toJson() {
    return {
      'name': name,
      'imgs': imgs,
      'category': category,
      'description': description,
      'price': price.toString(),
      'seller': seller,
      'latitude': latitude,
      'longitude': longitude
    };
  }
}
