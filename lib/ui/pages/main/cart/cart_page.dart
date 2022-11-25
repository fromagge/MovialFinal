import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:oferi/ui/controllers/product_controller.dart';
import 'package:oferi/ui/pages/main/bottom_navbar.dart';
import 'package:oferi/ui/pages/main/cart/checkout.dart';
import 'package:oferi/ui/widgets/input_widgets/button_widget.dart';
import 'package:oferi/ui/widgets/menu_widgets/title_widget.dart';
import 'package:oferi/ui/widgets/product_widgets/product_list_tile.dart';
import "package:flutter/material.dart";
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);
  ProductController productController = ProductController();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      child: Scaffold(
          backgroundColor: const Color(0xFFF3D9FA),
          body: SafeArea(
            top: false,
            bottom: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 7),
                  child: const TitleWidget(
                    title: "Mi Carrito",
                    titleSize: 28,
                    arrowSize: 42.5,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 7),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(10),
                      child: generateList(),
                    ),
                  ),
                ),
                SizedBox(
                    width: 315,
                    child: DefaultButtonWidget(
                        edgeInset: const EdgeInsets.only(bottom: 15),
                        label: "Ir a comprar",
                        onPressed: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: const CheckoutPage(),
                            withNavBar: false,
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        },
                        buttonColor: const Color(0xFF42006E)))
              ],
            ),
          )),
    );
  }

  Widget generateList() {
    return GetX<ProductController>(
      builder: (controller) {
        if (productController.products.length == 0) {
          return const Center(
            child: Text('No products'),
          );
        }
        return ListView.separated(
          shrinkWrap: true,
          itemCount: productController.products.length,
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            var element = productController.products[index];
            return ProductListTile(
              product: element,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              height: 10,
            );
          },
        );
      },
    );
  }
}
