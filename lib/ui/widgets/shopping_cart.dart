import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:oferi/domain/entities/product.dart';
import 'package:oferi/ui/pages/main/home/product_detailed_page.dart';

class ItemCart extends StatelessWidget {
  const ItemCart({super.key, required this.product});

  final Product product;

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
                child: thumbnail(product.imgs[0]),
              )),
          Parent(
            style: ParentStyle()
              ..padding(left: 18, right: 21, top: 0)
              ..offset(4, 0),
            gesture: Gestures()
              ..onTap(() {
                Get.to(ProductDetailedPage(product: product));
              }),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Txt(product.name,
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
                      '\$ ${product.price.toStringAsFixed(2)}')
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
