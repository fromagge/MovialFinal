import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';
import 'package:oferi/ui/pages/main/bottom_navbar.dart';
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

  late int current;

  @override
  void initState() {
    super.initState();
    current = -1;
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
                    menuLabel("Envío"),
                    Container(
                      margin: const EdgeInsets.only(bottom: 7),
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(10),
                        child: generateProductList(),
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
                                    TextSpan(
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
                                onPressed: () {
                                  {
                                    showOkCancelAlertDialog(
                                        context: context,
                                        builder: ((context, child) =>
                                            confirmationValue(context)));
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
          ..fontSize(20)),
  );
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
                        onPressed: () {},
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

Widget generateProductList() {
  return ListView.separated(
    physics: const ClampingScrollPhysics(),
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: 20,
    itemBuilder: (context, index) {
      return Container(
        child: const Text("HOLA"),
      );
    },
    separatorBuilder: (BuildContext context, int index) {
      return const SizedBox(height: 12);
    },
  );
}
