import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:oferi/ui/pages/loading/loader_widget.dart';
import 'package:oferi/ui/widgets/product%20widgets/product_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:oferi/domain/entities/product.dart';
import 'package:oferi/ui/widgets/item_card.dart';

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
  const ProductGrid({Key? key}) : super(key: key);

  @override
  State<ProductGrid> createState() => _ProductGrid();
}

class _ProductGrid extends State<ProductGrid> {
  CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: products.limit(10).get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            EasyLoading.show();
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData) {
              EasyLoading.dismiss();
              List<Product> data = [];
              for (var doc in snapshot.data!.docs) {
                var json = doc.data() as Map<String, dynamic>;

                data.add(Product.fromJson(json));
              }

              return HorizList(data: data);
            }
            break;
          default:
            return const Txt("Fatal error");
        }
        return const LoaderWidget();
      },
    );
  }
}

class HorizList extends StatelessWidget {
  HorizList({super.key, required this.data});

  final int columns = 2;
  final List data;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: MasonryGridView.count(
            shrinkWrap: true,
            crossAxisCount: columns,
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            crossAxisSpacing: 15,
            itemCount: data.length,
            mainAxisSpacing: 17,
            itemBuilder: (context, index) {
              return ProductCard(drink: data[index]);
            }));
  }
}
