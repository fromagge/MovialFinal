import 'package:oferi/ui/utils/utils.dart';

class Product {
  String id;
  String name;
  String imgUrl;
  String category;
  String seller;
  double latitude;
  double longitude;
  double? price;

  Product(
      {required this.id,
      required this.name,
      required this.imgUrl,
      required this.category,
      required this.seller,
      required this.latitude,
      required this.longitude,
      price})
      : price = (price == null) ? randomFloat(100) : price;

  factory Product.fromJson(Map<String, dynamic> json) {
    print(json["id"]);
    return Product(
        id: json["id"],
        name: json["name"],
        imgUrl: json['img'].replaceAll("'", '').toString().trim(),
        category: json['category'],
        seller: json['seller'],
        latitude: json['latitude'],
        longitude: json['longitude']);
  }
}
