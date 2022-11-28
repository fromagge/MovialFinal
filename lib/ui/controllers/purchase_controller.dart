import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:oferi/domain/entities/product.dart';
import 'package:oferi/domain/entities/purchase.dart';
import 'package:oferi/ui/controllers/product_controller.dart';
import 'authentication_controller.dart';

enum PaymentMethods { TARJETA_DE_CREDITO }

// Controlador usado para manejar los usuarios del chat
class PurchaseController extends GetxController {
  final purchaseRef = FirebaseFirestore.instance.collection('purchase');

  var _purchases = <Purchase>[].obs;

  get purchases => _purchases;

  Future<void> makePurchase(List<Product> products,
      PaymentMethods paymentMethod, String address) async {
    var uid = AuthenticationController().getUid();
    logInfo(
        "PurchaseController --> Haciendo Purchase con Productos: $products y metodo de pago: $paymentMethod");
    Purchase newPurchase = Purchase(
        address: address,
        purchaseDate: DateTime.now(),
        paymentMethod: paymentMethod.toString(),
        userId: uid,
        purchasedItems: products.map((e) => e.id).toList(),
        deliveredDate: DateTime.now());
    products.forEach((element) {
      element.purchased = true;
      logInfo("editing ${element.id} with purchased: ${element.purchased}");
      ProductController().editPublishedProduct(element.id, element);
    });

    await purchaseRef.add(newPurchase.toJson());
  }

  Future<List<Purchase>> getPurchaseList() async {
    var uid = AuthenticationController().getUid();
    QuerySnapshot purchases =
        await purchaseRef.where('userId', isEqualTo: uid).get();

    List<Purchase> data = [];

    for (var purchase in purchases.docs) {
      Map<String, dynamic> json = purchase.data() as Map<String, dynamic>;
      json['id'] = purchase.id;

      data.add(Purchase.fromJson(json));
    }
    logInfo("PurchaseController --> Purchase List $data");
    return data;
  }

  Future<Purchase> getPurchaseById(String documentId) async {
    DocumentSnapshot purchase = await FirebaseFirestore.instance
        .collection('purchase')
        .doc(documentId)
        .get();

    return Purchase.fromJson(purchase.data() as Map<String, dynamic>);
  }

  Future<List<Product>> getProductsInPurchase(String purchaseId) async {
    Purchase purchase = await getPurchaseById(purchaseId);
    List<Product> data = [];

    for (var item in purchase.purchasedItems) {
      DocumentSnapshot product = await FirebaseFirestore.instance
          .collection('products')
          .doc(item)
          .get();

      var json = product.data() as Map<String, dynamic>;
      //NO BORRAR
      json["id"] = product.id;
      data.add(Product.fromJson(json));
    }

    return data;
  }
}
