import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:oferi/ui/pages/main/bottom_navbar.dart';
import 'package:oferi/ui/pages/main/home/home_page.dart';
import 'package:oferi/ui/pages/main/user/profile_page.dart';
import 'package:oferi/ui/widgets/menu_widgets/title_widget.dart';
import 'package:oferi/ui/widgets/shopping_cart.dart';
import 'package:oferi/domain/entities/product.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  _CheckoutPage createState() => _CheckoutPage();
}

class _CheckoutPage extends State<CheckoutPage> {
  _CheckoutPage();

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
                              Txt("Dirección:",
                                  style: TxtStyle()
                                    ..padding(bottom: 10)
                                    ..fontSize(19)),
                              Txt("Calle 76#34b-125 Edificio Omero",
                                  style: TxtStyle()
                                    ..textColor(Colors.grey.shade700)
                                    ..fontWeight(FontWeight.w400)
                                    ..fontSize(17.5)),
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.edit,
                                size: 28,
                              ))
                        ]),
                    Txt(
                      "",
                      style: TxtStyle()..padding(top: 10),
                    ),
                    Parent(
                      style: ParentStyle()..margin(top: 15, bottom: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Txt("Envio",
                                style: TxtStyle()
                                  ..fontWeight(FontWeight.w900)
                                  ..fontSize(18)),
                            Txt("3 to 5 days",
                                gesture: Gestures()
                                  ..onTap(() {
                                    EasyLoading.showError(
                                        "You cannot change your past");
                                  }),
                                style: TxtStyle()
                                  ..fontWeight(FontWeight.w600)
                                  ..ripple(true))
                          ]),
                    ),
                    Parent(
                      style: ParentStyle()..margin(top: 25, bottom: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Txt("Products",
                                style: TxtStyle()
                                  ..fontWeight(FontWeight.w900)
                                  ..fontSize(18)),
                          ]),
                    ),
                    Parent(
                      style: ParentStyle()..margin(top: 15, bottom: 15),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Txt("Método de pago",
                                style: TxtStyle()
                                  ..fontWeight(FontWeight.w900)
                                  ..fontSize(18)),
                            Txt("Change",
                                style: TxtStyle()
                                  ..fontWeight(FontWeight.w900)
                                  ..ripple(true))
                          ]),
                    ),
                    Column(children: []),
                    Txt("Buy now",
                        gesture: Gestures()
                          ..onTap(() async {
                            showOkCancelAlertDialog(
                                message: "",
                                title: "Want to see your shipment guide?",
                                okLabel: "Yes",
                                cancelLabel: "No",
                                context: context,
                                builder: ((context, child) =>
                                    confirmationValue(context)));
                          }),
                        style: TxtStyle()
                          ..ripple(true)
                          ..borderRadius(all: 15.0)
                          ..fontSize(20)
                          ..padding(vertical: 15.0, horizontal: 20.0)
                          ..margin(bottom: 300)
                          ..background.color(Colors.black)
                          ..textColor(Colors.white)
                          ..width(400)
                          ..margin(top: 20)
                          ..textAlign.center(true)),
                    Txt("", style: TxtStyle()..padding(top: 30)),
                  ],
                )),
          ]))),
    );
  }
}

Widget confirmationValue(BuildContext context) => Center(
      child: Container(
        margin: const EdgeInsets.only(bottom: 50),
        width: 270,
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Parent(
              style: ParentStyle()
                ..background.color(Colors.white)
                ..borderRadius(all: 10)
                ..height(135),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                            screen: const ProfilePage(),
                            withNavBar: false,
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
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
