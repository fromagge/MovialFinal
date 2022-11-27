import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:oferi/domain/entities/product.dart';
import 'package:oferi/ui/controllers/authentication_controller.dart';

import '../../domain/entities/cart.dart';

// Controlador usado para manejar los usuarios del chat
class CartController extends GetxController {
  final databaseReference = FirebaseDatabase.instance.ref();
  final uid = AuthenticationController().getUid();

  Future<Cart> getCurrentUserCart() async {
    DocumentSnapshot cart;
    final cartsRef = FirebaseFirestore.instance.collection('carts');

    cart = await cartsRef.doc(uid).get();

    if (!cart.exists) {
      await cartsRef.doc(uid).set({'items': []});
      return Cart(id: uid, items: []);
    }

    return Cart.fromJson(uid, cart.data() as Map<String, dynamic>);
  }

  Future<List<Product>> getProductsInCart() async {
    Cart cart = await getCurrentUserCart();
    logInfo(cart);

    List<Product> data = [];

    for (var item in cart.items) {
      logInfo(item);
      DocumentSnapshot product = await FirebaseFirestore.instance
          .collection('products')
          .doc(item)
          .get();
      logInfo("Product $product");
      var json = product.data() as Map<String, dynamic>;
      json["id"] = product.id;
      data.add(Product.fromJson(json));
      logInfo("JSON ES $json");
    }
    logInfo("DATOS $data");
    return data;
  }

  Future<void> addProducToCart(String productId) async {
    final cartsRef = FirebaseFirestore.instance.collection('carts');
    DocumentSnapshot product = await FirebaseFirestore.instance
        .collection('products')
        .doc(productId)
        .get();

    if (product.exists) {
      var cart = await getCurrentUserCart();
      for (var item in cart.items) {
        if (item == productId) {
          return; //  Esto quiere decir que el elemento ya está en el carro
        }
      }

      cart.addElementToCart(productId);
      cartsRef.doc(uid).update({'items': cart.items});
    } else {
      // Error ? Producto no existe en la base de datos
    }
  }
}
