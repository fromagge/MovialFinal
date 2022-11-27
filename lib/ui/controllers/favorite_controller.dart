import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:oferi/domain/entities/product.dart';
import 'package:oferi/ui/controllers/authentication_controller.dart';
import '../../domain/entities/cart.dart';

// Controlador usado para manejar los usuarios del chat
class FavoriteController extends GetxController {
  final favoritesRef = FirebaseFirestore.instance.collection('favorites');
  final uid = AuthenticationController().getUid();

  Future<Cart> getCurrentUserFavoriteList() async {
    DocumentSnapshot favorites;

    favorites = await favoritesRef.doc(uid).get();

    if (!favorites.exists) {
      await favoritesRef.doc(uid).set({'items': []});
      return Cart(id: uid, items: []);
    }

    return Cart.fromJson(uid, favorites.data() as Map<String, dynamic>);
  }

  Future<List<Product>> getProductsInFavoriteList() async {
    Cart cart = await getCurrentUserFavoriteList();

    List<Product> data = [];

    for (var item in cart.items) {
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

  Future<void> addProducToFavorite(String productId) async {
    DocumentSnapshot product = await FirebaseFirestore.instance
        .collection('products')
        .doc(productId)
        .get();

    if (product.exists) {
      Cart cart = await getCurrentUserFavoriteList();
      for (var item in cart.items) {
        if (item == productId) {
          return; //  Esto quiere decir que el elemento ya está en el carro
        }
      }

      cart.addElementToCart(productId);
      await favoritesRef.doc(uid).update({'items': cart.items});
    } else {
      // Error ? Producto no existe en la base de datos
    }
  }

  Future<void> removeElementFromFavorite(String productId) async {
    Cart cart = await getCurrentUserFavoriteList();
    cart.eraseElementFromCart(productId);
    await favoritesRef.doc(uid).update({'items': cart.items});
  }
}
