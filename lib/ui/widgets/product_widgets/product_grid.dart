import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:oferi/ui/controllers/product_controller.dart';
import 'package:oferi/ui/pages/loading/loader_widget.dart';
import 'package:oferi/ui/pages/main/bottom_navbar.dart';
import 'package:oferi/ui/widgets/product_widgets/product_grid_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:oferi/domain/entities/product.dart';
import 'package:loggy/loggy.dart';
import 'package:oferi/ui/widgets/product_widgets/product_list_tile.dart';

class ProductGrid extends StatefulWidget {
  const ProductGrid({Key? key}) : super(key: key);

  @override
  State<ProductGrid> createState() => _ProductGrid();
}

class _ProductGrid extends State<ProductGrid> {
  ProductController productController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return horizList(productController.products);
  }

  Widget horizList(List<Product> products) {
    final int columns = 2;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: MasonryGridView.count(
        shrinkWrap: true,
        crossAxisCount: columns,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        crossAxisSpacing: 15,
        itemCount: products.length,
        mainAxisSpacing: 17,
        itemBuilder: (context, index) {
          return ProductGridCard(product: products[index]);
        },
      ),
    );
  }
}
