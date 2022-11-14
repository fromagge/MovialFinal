import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:oferi/domain/entities/product.dart';
import 'package:oferi/ui/pages/main/home/product_detailed_page.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({super.key, required this.product});

  bool markedFavorite = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          //Cuando el producto es seleccionado
          () => ProductDetailedPage(product: product),
        );
      },
      child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 2, color: Color(0xFFE4E0E0))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  thumbnail(product.imgUrl),
                  Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white),
                    child: IconButton(
                      icon: const Icon(Icons.favorite_outline_sharp,
                          color: Colors.red),
                      iconSize: 30,
                      onPressed: () {},
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                product.name,
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    SizedBox(
                        width: 112,
                        child: Text(
                          "\$ ${product.price}",
                          style: TextStyle(fontSize: 20),
                        )),
                    Container(
                        child: IconButton(
                      icon: const Icon(Icons.add_circle,
                          color: Color(0xFF42006E)),
                      iconSize: 35,
                      onPressed: () {},
                    ))
                  ],
                ),
              )
            ],
          )),
    );
  }

  Widget thumbnail(url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
        width: double.infinity,
        height: 200,
        child: FittedBox(
          fit: BoxFit.fill,
          child: Image.network(
            url,
          ),
        ),
      ),
    );
  }
}
