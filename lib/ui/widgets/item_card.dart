import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ConstrainedBox(
                constraints:
                    const BoxConstraints(maxHeight: 325, maxWidth: 200),
                child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        thumbnail(),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                  width: 100,
                                  height: 70,
                                  child: AutoSizeText(
                                    "Cable USB V4 Amarillo y Azul y Verde",
                                    style: TextStyle(
                                      fontSize: 50,
                                    ),
                                    maxLines: 3,
                                    minFontSize: 17,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                              SizedBox(
                                  width: 30,
                                  child: IconButton(
                                      onPressed: () => {},
                                      icon: const Icon(
                                        Icons.favorite_border,
                                        color: Colors.red,
                                        size: 35,
                                      )))
                            ]),
                        const SizedBox(
                            width: 280,
                            height: 48,
                            child: AutoSizeText(
                              "\$100.150.000",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic, fontSize: 20),
                              maxLines: 1,
                              minFontSize: 22,
                              overflow: TextOverflow.ellipsis,
                            )),
                      ],
                    )))));
  }

  Widget thumbnail() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          "assets/images/owl.jpg",
          scale: 1,
        ));
  }
}
