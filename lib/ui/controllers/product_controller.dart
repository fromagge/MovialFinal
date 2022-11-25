import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:oferi/domain/entities/product.dart';

// Controlador usado para manejar los usuarios del chat
class ProductController extends GetxController {
  final databaseReference = FirebaseDatabase.instance.ref();

  var _products = <Product>[].obs;
  // devolvemos a la UI todos los usuarios excepto el que está logeado en el sistema
  // esa lista será usada para la pantalla en la que listan los usuarios con los que se
  // puede comenzar una conversación
  get products {
    getProducts();
    return _products.toList();
  }

  Future<void> getProducts() async {
    var list =
        await FirebaseFirestore.instance.collection('products').limit(20).get();
    List<Product> data = [];

    for (var doc in list.docs) {
      var json = doc.data() as Map<String, dynamic>;

      data.add(Product.fromJson(json));
    }
    _products.value = data;
  }
}
