import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:oferi/domain/entities/product.dart';

import '../../domain/entities/cart.dart';

// Controlador usado para manejar los usuarios del chat
class CartController extends GetxController {
  final databaseReference = FirebaseDatabase.instance.ref();

  var _products = <Product>[].obs;
  // devolvemos a la UI todos los usuarios excepto el que está logeado en el sistema
  // esa lista será usada para la pantalla en la que listan los usuarios con los que se
  // puede comenzar una conversación
  get products {
    getProducts();
    return _products.toList();
  }

  Future<Cart> getCurrentUserCart() async {
    final cartsRef = FirebaseFirestore.instance.collection('carts');
    var cart;

    // donde dice user_id debe ir el id con el que se creo que cliente
    // no sé si se esté guardando

    cart = await cartsRef.doc(USER_ID).get();

    if (!cart.exists) {
      await cartsRef.doc(USER_ID).set({'items': []});
      return Cart(id: USER_id, items: []);
    }

    return Cart.fromJson(USER_ID, cart);
  }

  Future<void> getProductsInCart() async {
    final cartsRef = FirebaseFirestore.instance.collection('carts');

    var cart = await getCurrentUserCart();

    List<Product> data = [];

    for (var item in cart.items) {
      var product = await FirebaseFirestore.instance
          .collection('prodcuts')
          .doc(item)
          .get();

      var json = product.data() as Map<String, dynamic>;

      data.add(Product.fromJson(json));
    }
    _products.value = data;
  }

  Future<void> addProducToCart(String productId) async {
    final cartsRef = FirebaseFirestore.instance.collection('carts');
    var product = await FirebaseFirestore.instance
        .collection('prodcuts')
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
      cartsRef.doc(USER_ID).update({'items': cart.items});
    } else {
      // Error ? Producto no existe en la base de datos
    }
  }
}
