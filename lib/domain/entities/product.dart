import 'package:oferi/ui/utils/utils.dart';

class Product {
  String id;
  String name;
  String imgUrl;
  String category;
  String seller;
  double latitude;
  double longitude;
  double price;

  Product(
      {required this.id,
      required this.name,
      required this.imgUrl,
      required this.category,
      required this.seller,
      required this.latitude,
      required this.longitude,
      required this.price});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json["id"],
        name: json["name"],
        imgUrl: json['img'].replaceAll("'", '').toString().trim(),
        price: json['price'],
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
      'price': price,
      'seller': seller,
      'latitude': latitude,
      'longitude': longitude
    };
  }
}
