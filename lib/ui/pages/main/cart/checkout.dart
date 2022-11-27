import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:oferi/ui/controllers/cart_controller.dart';
import 'package:oferi/ui/controllers/purchase_controller.dart';
import 'package:oferi/ui/pages/main/bottom_navbar.dart';
import 'package:oferi/ui/pages/main/cart/package_delivery_tracking.dart';
import 'package:oferi/ui/utils/validator.dart';
import 'package:oferi/ui/widgets/input_widgets/button_widget.dart';
import 'package:oferi/ui/widgets/menu_widgets/title_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  _CheckoutPage createState() => _CheckoutPage();
}

class _CheckoutPage extends State<CheckoutPage> {
  _CheckoutPage();

  CartController cartController = Get.find();
  PurchaseController purchaseController = Get.find();

  late TextEditingController addressController;
  late int current;

  @override
  void initState() {
    super.initState();
    current = -1;
    addressController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(4),
          child: SafeArea(
              child: Column(children: [
            Parent(
                style: ParentStyle()
                  ..padding(horizontal: 16)
                  ..alignmentContent.center(true),
                child: Column(
                  children: [
                    const TitleWidget(
                      title: "Comprar",
                      titleSize: 26,
                      arrowSize: 40,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              menuLabel("Dirección"),
                              SizedBox(
                                width: 320,
                                height: 40,
                                child: TextFormField(
                                  controller: addressController,
                                  style: const TextStyle(fontSize: 20),
                                  validator: (value) =>
                                      Validator.validateText(value ?? ""),
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(
                                      top: 15,
                                      bottom: 10,
                                      left: 10,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                    errorStyle: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ]),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        menuLabel("Envío"),
                        const Text("Envio de 1 a 3 días hábiles",
                            style: TextStyle(
                                color: Color.fromARGB(125, 0, 0, 0),
                                fontWeight: FontWeight.w400,
                                fontSize: 18)),
                        Container(
                          height: 7,
                        ),
                        const Text("\$ 7.000",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 18)),
                      ],
                    ),
                    menuLabel("Productos:"),
                    Container(
                      margin: const EdgeInsets.only(bottom: 7),
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(10),
                        child: generateProductList(context),
                      ),
                    ),
                    Parent(
                      style: ParentStyle()
                        ..margin(top: 15, bottom: 15)
                        ..alignment.centerLeft(),
                      child: Txt("Método de pago",
                          style: TxtStyle()
                            ..fontWeight(FontWeight.w400)
                            ..fontSize(20)),
                    ),
                    Row(
                      children: [
                        brandButton("assets/images/icons/brands/PSE.png", 0),
                        brandButton(
                            "assets/images/icons/brands/mastercard.png", 1),
                        brandButton("assets/images/icons/brands/visa.png", 2),
                      ],
                    ),
                    Txt("", style: TxtStyle()..padding(top: 30)),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: [
                                    TextSpan(
                                        text: "TOTAL:",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey.shade600,
                                            fontWeight: FontWeight.w600)),
                                    const TextSpan(text: "\n"),
                                    const TextSpan(
                                        //TODO: CAMBIAR PRECIO POR EL TOTAL DE LA LISTA DE PRODUCTOS.
                                        text: "\$ 101.235.000",
                                        style: TextStyle(
                                            fontSize: 23,
                                            fontWeight: FontWeight.w400)),
                                  ]),
                            ),
                          ),
                          Expanded(
                            child: DefaultButtonWidget(
                                label: "Pagar",
                                onPressed: () async {
                                  {
                                    String address = addressController.text;
                                    if (address.isNotEmpty && current != -1) {
                                      showOkCancelAlertDialog(
                                          context: context,
                                          builder: ((context, child) =>
                                              confirmationValue(context)));

                                      var products = await cartController
                                          .getProductsInCart();

                                      await purchaseController.makePurchase(
                                          products,
                                          PaymentMethods.TARJETA_DE_CREDITO,
                                          address);
                                    } else {
                                      if (current == -1) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    "Select a payment method.")));
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    "Current address is empty.")));
                                      }
                                    }
                                  }
                                },
                                buttonColor: const Color(0xFFFF545F)),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ]))),
    );
  }

  var selected = List.generate(3, (index) => false);
  Widget brandButton(String path, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          if (current != index) {
            selected.setAll(0, [false, false, false]);
            selected[index] = true;
          }
          current = index;
          if (index == 0) {
          } else {
            if (index == 1) {
            } else {
              if (index == 2) {}
            }
          }
          logInfo("$current method of payment");
        });
      },
      borderRadius: BorderRadius.circular(50),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: selected[index] ? Colors.blue : Colors.transparent,
              width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(50)),
        ),
        width: 110,
        height: 80,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Image(
            image: AssetImage(path),
          ),
        ),
      ),
    );
  }
}

Widget menuLabel(String label) {
  return Parent(
    style: ParentStyle()
      ..margin(top: 15, bottom: 15)
      ..alignment.centerLeft(),
    child: Txt(label,
        style: TxtStyle()
          ..fontWeight(FontWeight.w400)
          ..fontSize(22)),
  );
}

Widget confirmationValue(BuildContext context) => Center(
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        width: 270,
        height: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Parent(
              style: ParentStyle()
                ..background.color(Colors.white)
                ..borderRadius(all: 10)
                ..height(135),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Txt(
                      "Su compra ha sido aprobada",
                      style: TxtStyle()
                        ..textColor(const Color(0xFF42006E).withOpacity(0.75))
                        ..fontSize(17)
                        ..textAlign.center(),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Txt("¿Desea Recibir la guía de pedido?",
                        style: TxtStyle()
                          ..textColor(const Color(0xFF42006E))
                          ..fontWeight(FontWeight.w500)
                          ..fontSize(25)
                          ..textAlign.center(true)),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              width: 200,
              height: 40,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: const NavBar(),
                          withNavBar: true,
                          pageTransitionAnimation: PageTransitionAnimation.fade,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          backgroundColor: Colors.white,
                          minimumSize: const Size(120, 50)),
                      child: const Text(
                        "NO",
                        style: TextStyle(
                          color: Color(0xFF42006E),
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: const PackageDeliveryTrackingPage(),
                            withNavBar: true,
                            pageTransitionAnimation:
                                PageTransitionAnimation.fade,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            backgroundColor: const Color(0xFF42006E),
                            minimumSize: const Size(120, 50)),
                        child: const Text(
                          "SI",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                  ]),
            )
          ],
        ),
      ),
    );

Widget generateProductList(BuildContext context) {
  return FutureBuilder(
    future: CartController().getProductsInCart(),
    builder: (context, snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.waiting:
          EasyLoading.show();
          return Container();

        case ConnectionState.done:
          if (snapshot.hasData) {
            var cart = snapshot.data!;
            EasyLoading.dismiss();
            return ListView.separated(
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: cart.length,
              itemBuilder: (context, index) {
                return SizedBox(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: RichText(
                        text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: [
                              TextSpan(
                                  text: cart[index].name,
                                  style: const TextStyle(
                                      color: Color.fromARGB(125, 0, 0, 0),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16)),
                              const TextSpan(text: "\n"),
                              TextSpan(
                                  text: cart[index].price.toStringAsFixed(2),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16)),
                            ]),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      height: 65,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: CachedNetworkImage(imageUrl: cart[index].imgUrl),
                      ),
                    )
                  ],
                ));
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 12);
              },
            );
          }

          return const Txt("Fatal error");
        default:
          return const Txt("Fatal error");
      }
    },
  );
}
