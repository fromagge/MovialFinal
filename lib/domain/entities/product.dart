import 'package:loggy/loggy.dart';
import 'package:oferi/ui/controllers/authentication_controller.dart';
import 'package:uuid/uuid.dart';

class Product {
  String id = const Uuid().v1();
  String name;
  List<String> imgs;
  String category;
  String seller = AuthenticationController().getUid();
  String? description;
  double latitude;
  double longitude;
  double price;

  Product(
      {required this.name,
      required this.imgs,
      required this.description,
      required this.category,
      required this.latitude,
      required this.longitude,
      required this.price});

  Product.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        description = json['description'] ?? '',
        imgs = List<String>.from(json['imgs']),
        price = json['price'] is int
            ? json['price'].toDouble()
            : double.parse(json['price']),
        category = json['category'],
        seller = json['seller'],
        latitude = json['latitude'],
        longitude = json['longitude'];

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
