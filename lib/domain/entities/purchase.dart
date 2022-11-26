import 'package:oferi/domain/entities/product.dart';

class Purchase extends Product {
  DateTime purchaseDate;
  DateTime deliveredDate;
  String paymentMethod;
  String address;
  Purchase(
      {id,
      name,
      category,
      imgUrl,
      latitude,
      longitude,
      seller,
      price,
      required this.purchaseDate,
      required this.address,
      required this.paymentMethod,
      required this.deliveredDate})
      : super(
          id: id,
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
        address: json['address'],
        deliveredDate: json['deliveredDate']);
  }
  toJson() {
    return {
      'name': name,
      'imgUrl': imgUrl,
      'category': category,
      'address': address,
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
