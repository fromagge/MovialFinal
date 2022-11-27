import 'package:flutter/material.dart';
import 'package:oferi/domain/entities/product.dart';
import 'package:oferi/ui/widgets/image_widgets/image_widget.dart';

class ProductListTile extends StatelessWidget {
  final Product product;
  ProductListTile({super.key, required this.product});

  bool markedFavorite = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
          height: height / 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  width: width / 2 - 40,
                  child: ImageWidget(imageUrl: product.imgUrl)),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: width / 2 - 10,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 6,
                          child: Text(
                            product.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: const TextStyle(
                                color: Color(0xFF42006E),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                      Expanded(
                          flex: 4,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 8,
                                child: Container(
                                  alignment: Alignment.bottomLeft,
                                  margin: const EdgeInsets.only(
                                      top: 15, bottom: 13),
                                  child: Text(
                                    product.price.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: const TextStyle(
                                      color: Color(0xFF42006E),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Align(
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      iconSize: 45,
                                      icon: const Icon(
                                        Icons.delete_rounded,
                                        color: Colors.red,
                                        size: 35,
                                      ),
                                      onPressed: () {
                                        // ignore: todo
                                        //TODO: Delete Product from Cart
                                      },
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )),
                    ]),
              )
            ],
          ),
        ));
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
