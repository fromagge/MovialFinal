import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/route_manager.dart';
import 'package:loggy/loggy.dart';
import 'package:oferi/domain/entities/product.dart';
import 'package:oferi/ui/pages/main/home/product_detailed_page.dart';
import 'package:oferi/ui/widgets/image_widgets/image_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class ProductGridCard extends StatefulWidget {
  final Product product;

  const ProductGridCard({super.key, required this.product});

  @override
  State<ProductGridCard> createState() => _ProductGridCardState();
}

class _ProductGridCardState extends State<ProductGridCard> {
  bool markedFavorite = false;

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
              Stack(
                alignment: Alignment.topRight,
                children: [
                  ImageWidget(imageUrl: widget.product.imgUrl),
                  Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white),
                    child: IconButton(
                      icon: markedFavorite
                          ? const Icon(Icons.favorite, color: Colors.red)
                          : const Icon(Icons.favorite_outline_sharp,
                              color: Colors.red),
                      iconSize: 30,
                      onPressed: () {
                        setState(() {
                          //TODO: ALMACENAR FAVORITO USANDO EL CONTROLADOR
                          markedFavorite
                              ? markedFavorite = false
                              : markedFavorite = true;
                        });
                      },
                    ),
                  )
                ],
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
                        Container(
                          color: Colors.amber,
                          padding: EdgeInsets.only(
                            left: constraints.minWidth,
                          ),
                          child: Text(
                            "\$ ${widget.product.price!.toStringAsFixed(2)}",
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle,
                              color: Color(0xFF42006E)),
                          iconSize: 35,
                          onPressed: () {
                            //TODO: ALMACENAR PRODUCTO EN EL CARRITO A TRAVES DEL CONTROLADOR
                            EasyLoading.showSuccess("Agregado al carrito");
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