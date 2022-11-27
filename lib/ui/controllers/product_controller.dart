import 'authentication_controller.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:oferi/domain/entities/product.dart';

// Controlador usado para manejar los usuarios del chat
class ProductController extends GetxController {
  final uid = AuthenticationController().getUid();
  final prodsRef = FirebaseFirestore.instance.collection('products');

  Future<List<Product>> getProducts() async {
    QuerySnapshot list = await prodsRef.limit(20).get();

    List<Product> data = [];

    for (QueryDocumentSnapshot doc in list.docs) {
      Map<String, dynamic> json = doc.data() as Map<String, dynamic>;
      json['id'] = doc.id;
      data.add(Product.fromJson(json));
    }

    return data;
  }

  Future<void> publishProduct(Product product) async {
    if (product.id == uid) {
      await prodsRef.add(product.toJson());
    }
  }
}
