import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/route_manager.dart';
import 'package:loggy/loggy.dart';
import 'package:get/get.dart';
import 'package:oferi/domain/entities/product.dart';
import 'package:oferi/ui/controllers/authentication_controller.dart';
import 'package:oferi/ui/controllers/cart_controller.dart';
import 'package:oferi/ui/controllers/favorite_controller.dart';
import 'package:oferi/ui/pages/main/home/product_detailed_page.dart';
import 'package:oferi/ui/widgets/image_widgets/image_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class ProductGridCard extends StatefulWidget {
  final Product product;
  final double? height;
  final double? width;
  bool markedFavorite = false;
  ProductGridCard({
    super.key,
    required this.product,
    this.height,
    this.width,
    this.markedFavorite = false,
  });

  @override
  State<ProductGridCard> createState() => _ProductGridCardState();
}

class _ProductGridCardState extends State<ProductGridCard> {
  FavoriteController favoriteController = Get.find();
  CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //Cuando el producto es seleccionado, ir a detalles.
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: ProductDetailedPage(product: widget.product),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 2, color: const Color(0xFFE4E0E0))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: widget.height,
                width: widget.width,
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                        alignment: Alignment.center,
                        child: ImageWidget(imageUrl: widget.product.imgs[0])),
                    Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white),
                      child: IconButton(
                        icon: widget.markedFavorite
                            ? const Icon(Icons.favorite, color: Colors.red)
                            : const Icon(Icons.favorite_outline_sharp,
                                color: Colors.red),
                        iconSize: 30,
                        onPressed: () {
                          setState(() {
                            widget.markedFavorite == false
                                ? favoriteController
                                    .addProducToFavorite(widget.product.id)
                                : favoriteController.removeElementFromFavorite(
                                    widget.product.id);
                            widget.markedFavorite
                                ? widget.markedFavorite = false
                                : widget.markedFavorite = true;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                widget.product.name,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 110,
                          child: Text(
                            "\$${widget.product.price}",
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        widget.product.seller ==
                                AuthenticationController().getUid()
                            ? Container()
                            : IconButton(
                                icon: const Icon(Icons.add_circle,
                                    color: Color(0xFF42006E)),
                                iconSize: 35,
                                onPressed: () {
                                  //TODO: ALMACENAR PRODUCTO EN EL CARRITO A TRAVES DEL CONTROLADOR
                                  EasyLoading.showSuccess(
                                      "Agregado al carrito");
                                  cartController
                                      .addProducToCart(widget.product.id);
                                },
                              )
                      ],
                    );
                  },
                ),
              )
            ],
          )),
    );
  }
}
