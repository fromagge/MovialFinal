import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:oferi/domain/entities/drink.dart';
import 'package:oferi/ui/pages/home/item.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.drink});

  final Drink drink;

  @override
  Widget build(BuildContext context) {
    return Parent(
        style: ParentStyle()
          ..border(all: 1.0, color: Colors.grey.shade400)
          ..borderRadius(all: 10.0),
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 6.0),
              child: SizedBox(
                height: 75,
                child: thumbnail(drink.imgUrl),
              )),
          Parent(
              style: ParentStyle()
                ..padding(left: 18, right: 21, top: 0)
                ..offset(4, 0),
              gesture: Gestures()
                ..onTap(() {
                  Get.to(ItemPage(drink: drink));
                }),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Txt(drink.name,
                        style: TxtStyle()
                          ..padding(all: 0)
                          ..fontSize(14)
                          ..height(15)),
                    Parent(
                      style: ParentStyle()..ripple(true),
                      child: const Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                        size: 16,
                      ),
                    )
                  ]))
        ]));
  }

  Widget thumbnail(url) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          url,
          scale: 1,
        ));
  }
}
