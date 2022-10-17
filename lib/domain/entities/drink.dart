import 'dart:ffi';

import 'package:oferi/utils.dart';

class Drink {
  String id;
  String name;
  String imgUrl;
  double? price;

  Drink({required this.id, required this.name, required this.imgUrl, price})
      : price = (price == null) ? randomFloat(100) : price;

  factory Drink.fromJson(Map<String, dynamic> json) {
    return Drink(
        id: json['idDrink'],
        name: json["strDrink"],
        imgUrl: json["strDrinkThumb"]);
  }
}
