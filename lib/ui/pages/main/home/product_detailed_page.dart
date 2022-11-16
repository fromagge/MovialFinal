import 'package:division/division.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oferi/domain/entities/product.dart';
import 'package:geolocator/geolocator.dart';
import 'package:oferi/ui/pages/cart_old/checkout.dart';
import 'package:oferi/ui/widgets/Input_Widgets/button_widget.dart';
import 'package:oferi/ui/widgets/carrousel.dart';
import 'package:get/get.dart';
import 'package:oferi/ui/widgets/menu%20widgets/title_widget.dart';

class ProductDetailedPage extends StatefulWidget {
  const ProductDetailedPage({super.key, required this.product});

  final Product product;

  @override
  _ItemPage createState() => _ItemPage(product);
}

class _ItemPage extends State<ProductDetailedPage> {
  _ItemPage(this.product);
  final Product product;
  late GoogleMapController mapController;

  @override
  void initState() {
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(0),
              child: Column(children: [
                TitleWidget(
                  title: "Detalles del Producto",
                  arrowSize: 50,
                ),
                Carousel(
                  infiniteScroll: false,
                  pageSnapping: false,
                  aspectRatio: 1.2,
                  images: [product.imgUrl],
                ),
                Parent(
                    style: ParentStyle()
                      ..padding(horizontal: 10)
                      ..alignmentContent.center(true),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.yellow,
                          child: Txt(
                              style: TxtStyle()
                                ..padding(horizontal: 0)
                                ..alignment.center()
                                ..maxLines(5)
                                ..fontSize(32.5)
                                ..fontWeight(FontWeight.bold)
                                ..textAlign.left(true),
                              "Chaleco Usado de Cuero (Todavia funcional)"),
                        ),
                        Container(
                            color: Colors.amber,
                            child: Txt(
                                style: TxtStyle()
                                  ..fontSize(30)
                                  ..alignment.centerRight()
                                  ..fontWeight(FontWeight.bold)
                                  ..textAlign.left(true),
                                '\$ ${product.price!.toStringAsFixed(2)}')),
                        Txt(
                            style: TxtStyle()
                              ..fontSize(20)
                              ..margin(top: 20, bottom: 40)
                              ..textAlign.justify(true),
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce pretium massa ipsum, convallis dignissim elit placerat vitae. Maecenas nec interdum dui. Mauris eleifend, massa sit amet tincidunt pharetra, est mauris suscipit mauris, ac bibendum massa neque non nulla. Ut lorem odio, vehicula sed dui a, sagittis consequat augue. Donec porttitor quam vel nibh aliquet auctor. Vestibulum lobortis a eros non dictum. Pellentesque placerat semper mauris suscipit molestie."),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 4,
                              child: GoogleMap(
                                  onMapCreated: _onMapCreated,
                                  mapType: MapType.normal,
                                  initialCameraPosition: CameraPosition(
                                    target: LatLng(
                                        product.latitude, product.longitude),
                                    zoom: 15.0,
                                  )),
                            )),
                        Container(
                          height: 120,
                        )
                      ],
                    ))
              ]),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: DefaultButtonWidget(
                  label: "Agregar al carrito",
                  onPressed: () {
                    EasyLoading.showSuccess(
                      "Agregado al carrito",
                    ).then((value) => Get.to(CheckoutPage()));
                  },
                  buttonColor: Color(0xFFFF545F)),
            )
          ],
        ),
      ),
    );
  }
}
