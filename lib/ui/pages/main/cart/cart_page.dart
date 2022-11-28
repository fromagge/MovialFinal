// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:oferi/domain/entities/product.dart';
import 'package:oferi/ui/controllers/cart_controller.dart';
import 'package:oferi/ui/controllers/product_controller.dart';
import 'package:oferi/ui/pages/main/cart/checkout.dart';
import 'package:oferi/ui/widgets/image_widgets/image_widget.dart';
import 'package:oferi/ui/widgets/input_widgets/button_widget.dart';
import 'package:oferi/ui/widgets/menu_widgets/title_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartController cartController = Get.find();

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
                        onPressed: () async {
                          List<Product> products =
                              await cartController.getProductsInCart();
                          products.isNotEmpty
                              ? PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: const CheckoutPage(),
                                  withNavBar: false,
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                )
                              : ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Cart is empty")));
                        },
                        buttonColor: const Color(0xFF42006E)))
              ],
            ),
          )),
    );
  }

  Widget generateList() {
    return FutureBuilder(
      future: cartController.getProductsInCart(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            EasyLoading.show();
            return Container();
          case ConnectionState.none:
            EasyLoading.dismiss();
            return Container();

          case ConnectionState.done:
            EasyLoading.dismiss();
            if (snapshot.hasData) {
              var cart = snapshot.data!;
              if (cart.isEmpty) {
                return const Center(
                  child: Text('No products'),
                );
              }

              return ListView.separated(
                shrinkWrap: true,
                itemCount: cart.length,
                scrollDirection: Axis.vertical,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  var element = cart[index];

                  return productListTile(
                    element,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 10,
                  );
                },
              );
            }
            return const Text("Ocurrio algun error");

          default:
            return Container();
        }
      },
    );
  }

  Widget productListTile(Product product) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
          height: height / 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  width: width / 2 - 40,
                  child: ImageWidget(imageUrl: product.imgs[0])),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: width / 2 - 10,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 6,
                          child: Text(
                            product.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: const TextStyle(
                                color: Color(0xFF42006E),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                      Expanded(
                          flex: 4,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 8,
                                child: Container(
                                  alignment: Alignment.bottomLeft,
                                  margin: const EdgeInsets.only(
                                      top: 15, bottom: 13),
                                  child: Text(
                                    product.price.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: const TextStyle(
                                      color: Color(0xFF42006E),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Align(
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      iconSize: 45,
                                      icon: const Icon(
                                        Icons.delete_rounded,
                                        color: Colors.red,
                                        size: 35,
                                      ),
                                      onPressed: () async {
                                        await cartController
                                            .removeElementFromCart(product.id);
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )),
                    ]),
              )
            ],
          ),
        ));
  }
}
