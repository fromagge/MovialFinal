class Product {
  String id;
  String name;
  String imgUrl;
  String category;
  String seller;
  String? description;
  double latitude;
  double longitude;
  double price;

  Product(
      {required this.id,
      required this.name,
      required this.imgUrl,
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
        imgUrl: json['img'].replaceAll("'", '').toString().trim(),
        price: getPrice(json['price']),
        category: json['category'],
        seller: json['seller'],
        latitude: json['latitude'],
        longitude: json['longitude']);
  }

  toJson() {
    return {
      'name': name,
      'imgUrl': imgUrl,
      'category': category,
      'description': description,
      'price': price.toString(),
      'seller': seller,
      'latitude': latitude,
      'longitude': longitude
    };
  }

  static double getPrice(price) {
    if (price is String) {
      if (price.split('.').length > 2) {
        var value = double.tryParse(price);
        if (value != null) {
          return value;
        }

        return 0.0;
      }

      return double.parse(price);
    }

    if (price is double) {
      return price;
    }

    return 0.0;
  }
}
