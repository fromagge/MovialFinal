import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:oferi/domain/entities/drink.dart';
import 'package:oferi/ui/widgets/shopping_cart.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  _CheckoutPage createState() => _CheckoutPage();
}

class _CheckoutPage extends State<CheckoutPage> {
  _CheckoutPage();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Parent(
            style: ParentStyle()..padding(top: 40),
            child: Column(children: [
              Parent(
                  style: ParentStyle()
                    ..padding(horizontal: 16)
                    ..alignmentContent.center(true),
                  child: Column(
                    children: [
                      Row(children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_circle_left_outlined,
                            color: Color(0xFF42006E),
                          ),
                          iconSize: 45,
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            Get.back();
                          },
                        ),
                        Txt("Comprar",
                            style: TxtStyle()
                              ..textAlign.left(true)
                              ..textColor(Color(0xFF42006E))
                              ..padding(top: 20, bottom: 20, left: 5)
                              ..fontSize(25)
                              ..fontWeight(FontWeight.bold)),
                      ]),
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
                                      ..fontSize(15.5)),
                              ],
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.edit,
                                  size: 28,
                                ))
                          ]),
                      Txt(
                        "",
                        style: TxtStyle()..padding(top: 10),
                      ),
                      Column(
                        children: [
                          ItemCart(
                              drink: Drink(
                                  id: "123123",
                                  name: "Piña colada",
                                  imgUrl:
                                      "https://media.istockphoto.com/photos/pia-colada-cocktail-picture-id665567494?k=20&m=665567494&s=612x612&w=0&h=xWoN6E1r9CtgIy6v6jlkhmpQFqtsVYltlz9cVv0ZUvc=")),
                          ItemCart(
                              drink: Drink(
                                  id: "123123",
                                  name: "Bloody Mary",
                                  imgUrl:
                                      "https://lastfm.freetls.fastly.net/i/u/770x0/a5eebec6f210efdaa4cb62ed287d9954.jpg")),
                          ItemCart(
                              drink: Drink(
                                  id: "123123",
                                  name: "Moscow Mule",
                                  imgUrl:
                                      "https://d3gz3j27p2eka6.cloudfront.net/sites/default/files/styles/image_gallery_xl/public/images/node/article/complete%20moscow-mule-served-in-a-mug.jpg?itok=HOpsEyxK")),
                          ItemCart(
                              drink: Drink(
                                  id: "123123",
                                  name: "Don Julio",
                                  imgUrl:
                                      "https://elamigodelanoche.com/wp-content/uploads/2018/10/TEQUILA-DON-JULIO-BLANCO-750-ML-Web.jpg"))
                        ],
                      ),
                      Txt("",
                          style: TxtStyle()
                            ..width(500)
                            ..height(150)
                            ..margin(top: 15)
                            ..borderRadius(all: 15)
                            ..background.color(Colors.grey)),
                      Parent(
                        style: ParentStyle()..margin(top: 15, bottom: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Txt("Delivery",
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
                      Row(
                        children: [
                          Txt("",
                              style: TxtStyle()
                                ..width(50)
                                ..height(50)
                                ..margin(right: 10)
                                ..borderRadius(all: 50)
                                ..background.color(Colors.grey)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Txt("Debit **3493",
                                  style: TxtStyle()
                                    ..fontWeight(FontWeight.w800)),
                              Txt("PEPE JOHN")
                            ],
                          ),
                          Expanded(
                            child: Parent(style: ParentStyle()),
                          ),
                          Parent(
                            style: ParentStyle(),
                            child: Row(children: [
                              Txt("No. of Instalments ",
                                  style: TxtStyle()
                                    ..fontSize(12)
                                    ..textColor(Colors.grey)
                                    ..margin(right: 10)),
                              Txt("1",
                                  style: TxtStyle()
                                    ..fontWeight(FontWeight.w900))
                            ]),
                          )
                        ],
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
                                      confirmationValue()));
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
            ])));
  }
}

Widget confirmationValue() => Center(
        child: Parent(
      style: ParentStyle()
        ..background.color(Colors.white)
        ..width(200)
        ..borderRadius(all: 10)
        ..height(200),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Txt("Want to see you shipment tracking number?",
              style: TxtStyle()
                ..fontWeight(FontWeight.w900)
                ..fontSize(23)
                ..textAlign.center(true)),
          Row(children: [Txt("Yes"), Txt("No")])
        ],
      ),
    ));
