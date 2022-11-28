import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:oferi/domain/entities/product.dart';
import 'package:oferi/ui/controllers/authentication_controller.dart';
import '../../domain/entities/cart.dart';

// Controlador usado para manejar los usuarios del chat
class FavoriteController extends GetxController {
  final favoritesRef = FirebaseFirestore.instance.collection('favorites');

  Future<Cart> getCurrentUserFavoriteList() async {
    var uid = AuthenticationController().getUid();
    final favoritesRef = FirebaseFirestore.instance.collection('favorites');
    DocumentSnapshot favorites;
    favorites = await favoritesRef.doc(uid).get();

    if (!favorites.exists) {
      await favoritesRef.doc(uid).set({'items': []});
      return Cart(id: uid, items: []);
    }

    return Cart.fromJson(uid, favorites.data() as Map<String, dynamic>);
  }

  Future<List<Product>> getProductsInFavoriteList() async {
    Cart favorites = await getCurrentUserFavoriteList();
    logInfo("items en favorites ${favorites.items}");
    List<Product> data = [];

    for (var item in favorites.items) {
      DocumentSnapshot product = await FirebaseFirestore.instance
          .collection('products')
          .doc(item)
          .get();

      var json = product.data() as Map<String, dynamic>;
      data.add(Product.fromJson(json));
    }
    return data;
  }

  Future<void> addProducToFavorite(String productId) async {
    Cart favoriteList = await getCurrentUserFavoriteList();
    String uid = AuthenticationController().getUid();

    DocumentSnapshot favorites =
        await FirebaseFirestore.instance.collection('favorites').doc(uid).get();
    logInfo(favorites.exists);
    if (favorites.exists) {
      for (var item in favoriteList.items) {
        if (item == productId) {
          return; //  Esto quiere decir que el elemento ya está en favoritos
        }
      }
      logInfo("agregando a favoritos el producto $productId");
      favoriteList.addElementToCart(productId);
      await favoritesRef.doc(uid).update({'items': favoriteList.items});
    } else {
      // Error ? Producto no existe en la base de datos
    }
  }

  Future<void> removeElementFromFavorite(String productId) async {
    var uid = AuthenticationController().getUid();
    logInfo("FavoriteController --> remover $productId");
    Cart cart = await getCurrentUserFavoriteList();
    cart.eraseElementFromCart(productId);
    await favoritesRef.doc(uid).update({'items': cart.items});
  }
}
