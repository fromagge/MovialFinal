import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:oferi/domain/entities/drink.dart';
import 'package:oferi/ui/widgets/carrousel.dart';

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
                    ..padding(horizontal: 30)
                    ..alignmentContent.center(true),
                  child: Column(
                    children: [
                      Txt("Your order",
                          style: TxtStyle()
                            ..textAlign.left(true)
                            ..fontSize(32)
                            ..fontWeight(FontWeight.bold)),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Txt("Delivery Address",
                                    style: TxtStyle()..textColor(Colors.grey)),
                                Txt("Barranquilla",
                                    style: TxtStyle()
                                      ..fontWeight(FontWeight.w900)
                                      ..fontSize(18)),
                              ],
                            ),
                            Container(
                              child: Txt("Change",
                                  style: TxtStyle()
                                    ..fontWeight(FontWeight.w900)
                                    ..ripple(true)),
                            )
                          ]),
                      Txt("",
                          style: TxtStyle()
                            ..width(500)
                            ..height(150)
                            ..margin(top: 15)
                            ..borderRadius(all: 15)
                            ..background.color(Colors.grey)),
                      Txt("Delivery Time",
                          style: TxtStyle()
                            ..fontWeight(FontWeight.w900)
                            ..fontSize(18))
                    ],
                  )),
            ])));
  }
}
