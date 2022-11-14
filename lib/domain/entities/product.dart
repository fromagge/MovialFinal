import 'package:oferi/ui/utils/utils.dart';

class Product {
  String name;
  String imgUrl;
  String category;
  String seller;
  double latitude;
  double longitude;
  double? price;

  Product(
      {required this.name,
      required this.imgUrl,
      required this.category,
      required this.seller,
      required this.latitude,
      required this.longitude,
      price})
      : price = (price == null) ? randomFloat(100) : price;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        name: json["name"],
        imgUrl: json['img'].replaceAll("'", '').toString().trim(),
        category: json['category'],
        seller: json['seller'],
        latitude: json['latitude'],
        longitude: json['longitude']);
  }
}
