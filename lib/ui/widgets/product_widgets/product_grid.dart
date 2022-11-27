import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:oferi/ui/controllers/product_controller.dart';
import 'package:oferi/ui/widgets/product_widgets/product_grid_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:oferi/domain/entities/product.dart';

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
    return FutureBuilder(
      future: productController.getProducts(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            EasyLoading.show();
            return Container();
          case ConnectionState.done:
            EasyLoading.dismiss();
            if (snapshot.hasData) {
              var products = snapshot.data!;
              return horizList(products);
            }
            return Container();
          default:
            return Container();
        }
      },
    );
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
