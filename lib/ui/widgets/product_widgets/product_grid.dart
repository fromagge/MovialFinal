import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:oferi/ui/controllers/product_controller.dart';
import 'package:oferi/ui/controllers/search_controller.dart';
import 'package:oferi/ui/widgets/product_widgets/product_grid_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:oferi/domain/entities/product.dart';

class ProductGrid extends StatefulWidget {
  ProductGrid({Key? key, required this.searchText}) : super(key: key);
  String searchText;
  @override
  State<ProductGrid> createState() => _ProductGrid();
}

class _ProductGrid extends State<ProductGrid> {
  SearchController searchItems = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: searchItems.getSearchedItems(widget.searchText),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            EasyLoading.show();
            return Container();
          case ConnectionState.done:
            EasyLoading.dismiss();
            if (snapshot.hasData) {
              logInfo("ESTO ES EL SNAPSHOT DE RESULTADO ${snapshot.data}");
              if (snapshot.data!.isNotEmpty) {
                var products = snapshot.data![0];
                var favorites = snapshot.data![1];
                return horizList(products, favorites);
              }
            }
            return const Center(child: Text("Error de snapshot"));
          default:
            return const Center(child: Text("Error"));
        }
      },
    );
  }

  Widget horizList(List<Product> products, List<Product> favorites) {
    const int columns = 2;

    return products.isNotEmpty
        ? Container(
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
                Product? isFavorite = favorites.firstWhereOrNull(
                    (element) => element.id == products[index].id);

                return ProductGridCard(
                  product: products[index],
                  markedFavorite: isFavorite == null ? false : true,
                );
              },
            ),
          )
        : const Center(
            child: Text("No se encontraron productos con esta busqueda"),
          );
  }
}
