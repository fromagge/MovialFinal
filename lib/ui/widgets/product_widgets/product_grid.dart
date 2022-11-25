import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:oferi/ui/pages/loading/loader_widget.dart';
import 'package:oferi/ui/pages/main/bottom_navbar.dart';
import 'package:oferi/ui/widgets/product_widgets/product_grid_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:oferi/domain/entities/product.dart';
import 'package:loggy/loggy.dart';

Future fetchResource() async {
  final response = await http.get(
      Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/search.php?s=s'));

  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load album');
  }
}

class ProductGrid extends StatefulWidget {
  final List<Product> products;
  const ProductGrid({Key? key, required this.products}) : super(key: key);

  @override
  State<ProductGrid> createState() => _ProductGrid();
}

class _ProductGrid extends State<ProductGrid> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return horizList(widget.products);
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
