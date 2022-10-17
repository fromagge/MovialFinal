import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:oferi/domain/entities/drink.dart';
import 'package:oferi/ui/widgets/carrousel.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key, required this.drink});

  final Drink drink;

  @override
  _ItemPage createState() => _ItemPage(drink);
}

class _ItemPage extends State<ItemPage> {
  _ItemPage(this.drink);
  final Drink drink;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Parent(
      style: ParentStyle()..padding(top: 40),
      child: Column(children: [
        Carousel(
          images: [drink.imgUrl],
        ),
        Parent(
            style: ParentStyle()
              ..padding(horizontal: 30)
              ..alignmentContent.center(true),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Txt(
                          style: TxtStyle()
                            ..fontSize(60)
                            ..alignmentContent.center(true)
                            ..fontWeight(FontWeight.bold)
                            ..textAlign.left(true),
                          drink.name),
                      Txt(
                          style: TxtStyle()
                            ..fontSize(32)
                            ..alignmentContent.center(true)
                            ..fontWeight(FontWeight.bold)
                            ..textAlign.left(true),
                          '\$ ${drink.price!.toStringAsFixed(2)}'),
                    ]),
                Txt(
                    style: TxtStyle()
                      ..fontSize(20)
                      ..margin(top: 20)
                      ..textAlign.justify(true),
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce pretium massa ipsum, convallis dignissim elit placerat vitae. Maecenas nec interdum dui. Mauris eleifend, massa sit amet tincidunt pharetra, est mauris suscipit mauris, ac bibendum massa neque non nulla. Ut lorem odio, vehicula sed dui a, sagittis consequat augue. Donec porttitor quam vel nibh aliquet auctor. Vestibulum lobortis a eros non dictum. Pellentesque placerat semper mauris suscipit molestie."),
                Txt("Add to cart",
                    gesture: Gestures()
                      ..onTap(() async {
                        EasyLoading.showSuccess(
                          "Added to cart",
                        ).then((value) => Navigator.pop(context));
                      }),
                    style: TxtStyle()
                      ..ripple(true)
                      ..borderRadius(all: 15.0)
                      ..fontSize(20)
                      ..padding(vertical: 15.0, horizontal: 20.0)
                      ..background.color(Colors.black)
                      ..textColor(Colors.white)
                      ..width(400)
                      ..margin(top: 20)
                      ..textAlign.center(true))
              ],
            ))
      ]),
    ));
  }
}
