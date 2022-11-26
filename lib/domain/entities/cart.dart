import 'package:oferi/ui/utils/utils.dart';

class Cart {
  String id;
  List items;

  Cart({required this.id, required this.items});

  factory Cart.fromJson(String id, Map<String, dynamic> json) {
    return Cart(id: id, items: json["items"]);
  }

  void addElementToCart(String productId) {
    items.add(productId);
  }
}
