import 'package:oferi/domain/entities/product.dart';
import 'package:oferi/ui/utils/utils.dart';

class Purchase extends Product {
  DateTime purchaseDate;
  DateTime deliveredDate;
  String paymentMethod;

  Purchase(
      {name,
      category,
      imgUrl,
      latitude,
      longitude,
      seller,
      price,
      required this.purchaseDate,
      required this.paymentMethod,
      required this.deliveredDate})
      : super(
          name: name,
          category: category,
          imgUrl: imgUrl,
          latitude: latitude,
          longitude: longitude,
          seller: seller,
          price: price,
        );

  factory Purchase.fromJson(Map<String, dynamic> json) {
    return Purchase(
        name: json["name"],
        imgUrl: json['img'].replaceAll("'", '').toString().trim(),
        category: json['category'],
        seller: json['seller'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        purchaseDate: json['purchaseDate'],
        paymentMethod: json['paymentMethod'],
        price: json['price'],
        deliveredDate: json['deliveredDate']);
  }
  toJson() {
    return {
      'name': name,
      'imgUrl': imgUrl,
      'category': category,
      'seller': seller,
      'latitud': latitude,
      'longitude': longitude,
      'purchaseDate': purchaseDate,
      'paymentMethod': paymentMethod,
      'price': price,
      'deliveredDate': deliveredDate,
    };
  }
}
