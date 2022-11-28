import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:oferi/domain/entities/product.dart';
import 'package:oferi/ui/controllers/authentication_controller.dart';
import 'package:oferi/ui/controllers/favorite_controller.dart';
import 'package:oferi/ui/controllers/product_controller.dart';
import '../../domain/entities/cart.dart';

// Controlador usado para manejar los usuarios del chat
class SearchController extends GetxController {
  Future<List> getSearchedItems() async {
    List searchList = [
      await ProductController().getProducts(),
      await FavoriteController().getProductsInFavoriteList()
    ];
    return searchList;
  }
}
