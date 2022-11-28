import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:oferi/domain/entities/product.dart';
import 'package:oferi/ui/controllers/authentication_controller.dart';
import 'package:oferi/ui/controllers/favorite_controller.dart';
import 'package:oferi/ui/controllers/product_controller.dart';
import 'package:oferi/ui/widgets/Input_Widgets/image_button/image_button_grid.dart';
import '../../domain/entities/cart.dart';

// Controlador usado para manejar los usuarios del chat
class SearchController extends GetxController {
  ProductController productController = Get.find();

  Future<List> getSearchedItems(String search) async {
    List<Product> favorites =
        await FavoriteController().getProductsInFavoriteList();

    //Si la busqueda contiene una categoria
    if (ImageButtonGrid.categorias.contains(search)) {
      return await getCategoryItems(search, favorites);
    }

    List<Product> searchedProducts =
        await productController.searchProducts(search);

    List searchList = [searchedProducts, favorites];
    return searchList;
  }

  Future<List> getCategoryItems(
      String category, List<Product> favorites) async {
    List<Product> searchedProductsInCategories =
        await productController.searchProductsWithCategory(category);

    List searchList = [searchedProductsInCategories, favorites];
    return searchList;
  }
}
