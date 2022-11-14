import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:oferi/domain/entities/drink.dart';
import 'package:oferi/ui/pages/main/home/product_detailed_page.dart';

class ItemCart extends StatelessWidget {
  const ItemCart({super.key, required this.drink});

  final Drink drink;

  @override
  Widget build(BuildContext context) {
    return Parent(
        style: ParentStyle(),
        child: Row(children: [
          Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 6.0),
              child: SizedBox(
                height: 75,
                width: 75,
                child: thumbnail(drink.imgUrl),
              )),
          Parent(
            style: ParentStyle()
              ..padding(left: 18, right: 21, top: 0)
              ..offset(4, 0),
            gesture: Gestures()
              ..onTap(() {
                Get.to(ProductDetailedPage(drink: drink));
              }),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Txt(drink.name,
                  style: TxtStyle()
                    ..padding(all: 0)
                    ..fontSize(14)
                    ..height(15)
                    ..fontWeight(FontWeight.w900)),
              Txt("Lorem ipsum sit amet",
                  style: TxtStyle()
                    ..padding(all: 0)
                    ..fontSize(14)
                    ..height(15))
            ]),
          ),
          const Expanded(child: Txt("")),
          Parent(
              style: ParentStyle()..alignment.centerRight(true),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Txt(
                      style: TxtStyle()
                        ..fontWeight(FontWeight.w900)
                        ..fontSize(15)
                        ..textAlign.right(true),
                      '\$ ${drink.price!.toStringAsFixed(2)}')
                ],
              ))
        ]));
  }

  Widget thumbnail(url) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          url,
          scale: 1,
          fit: BoxFit.cover,
        ));
  }
}
