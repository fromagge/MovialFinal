import 'package:loggy/loggy.dart';
import 'package:oferi/ui/controllers/cart_controller.dart';
import 'package:oferi/ui/controllers/favorite_controller.dart';

import 'authentication_controller.dart';
import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:oferi/domain/entities/product.dart';

import 'file_controller.dart';

// Controlador usado para manejar los usuarios del chat
class ProductController extends GetxController {
  final prodsRef = FirebaseFirestore.instance.collection('products');

  Future<List<Product>> getProducts() async {
    QuerySnapshot list = await prodsRef.limit(20).get();

    List<Product> data = [];

    for (QueryDocumentSnapshot doc in list.docs) {
      Map<String, dynamic> json = doc.data() as Map<String, dynamic>;
      if (Product.fromJson(json).purchased == false) {
        data.add(Product.fromJson(json));
      }
    }

    return data;
  }

  Future<void> publishProduct(Product product, List<File>? images) async {
    var uid = AuthenticationController().getUid();
    logInfo("mi uid $uid");
    logInfo("el id del producto es ${product.id}");
    if (product.seller == uid) {
      if (images != null) {
        List<String> urls = [];

        for (File f in images) {
          String url = await uploadFileToServer(f);
          urls.add(url);
        }

        product.imgs = urls;
      }
      await prodsRef.doc(product.id).set(product.toJson());
    } else {
      logInfo("ERROR - DEBE SER EL MISMO USUARIO PARA CREAR PRODUCTO");
    }
  }

  Future<bool> removePublishedProduct(String productId) async {
    DocumentSnapshot product = await prodsRef.doc(productId).get();
    var uid = AuthenticationController().getUid();
    if (!product.exists) {
      return false;
    }

    Product prod = Product.fromJson(product.data() as Map<String, dynamic>);

    if (prod.seller == uid) {
      await prodsRef.doc(productId).delete();
      await CartController().removeElementFromCart(productId);
      await FavoriteController().removeElementFromFavorite(productId);
      return true; // Unnecessary
    } else {
      // Forbidden
      return false;
    }
  }

  Future<void> editPublishedProduct(String productId, Product newSpecs) async {
    DocumentSnapshot product = await prodsRef.doc(productId).get();

    var uid = AuthenticationController().getUid();
    if (!product.exists) {
      return;
    }

    Product prod = Product.fromJson(product.data() as Map<String, dynamic>);
    logInfo("editing with ${newSpecs.purchased}");
    if (prod.seller == uid) {
      await prodsRef.doc(productId).update(newSpecs.toJson());
    } else {
      // Forbidden
    }
  }

  Future<List<Product>> getProductsByCategory(String category) async {
    QuerySnapshot products =
        await prodsRef.where('category', isEqualTo: category).get();

    List<Product> data = [];

    for (var product in products.docs) {
      Map<String, dynamic> json = product.data() as Map<String, dynamic>;
      json['id'] = product.id;
      data.add(Product.fromJson(json));
    }

    return data;
  }

  Future<List<Product>> searchProducts(String search) async {
    List<Product> data = [];

    QuerySnapshot products = await prodsRef
        .orderBy('name', descending: true)
        .startAt([search]).endAt([search + '\uf8ff']).get();

    for (var product in products.docs) {
      Map<String, dynamic> json = product.data() as Map<String, dynamic>;
      json['id'] = product.id;
      data.add(Product.fromJson(json));
    }

    return data;
  }

  Future<List<Product>> searchProductsWithCategory(
      String category, String search) async {
    List<Product> data = [];

    QuerySnapshot products = await prodsRef
        .where('category', isEqualTo: category)
        .orderBy('name', descending: true)
        .startAt([search]).endAt([search + '\uf8ff']).get();

    for (var product in products.docs) {
      Map<String, dynamic> json = product.data() as Map<String, dynamic>;
      json['id'] = product.id;
      data.add(Product.fromJson(json));
    }

    return data;
  }
}
