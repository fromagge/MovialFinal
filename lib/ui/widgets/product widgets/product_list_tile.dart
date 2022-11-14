import 'package:flutter/material.dart';

class ProductListTile extends StatelessWidget {
  ProductListTile({super.key});

  bool markedFavorite = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 7, vertical: 10),
          height: height / 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: width / 2 - 40,
                child:
                    thumbnail("https://images4.alphacoders.com/936/936378.jpg"),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: width / 2 - 40,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 6,
                          child: Container(
                            child: Text(
                              "Chaqueta de Algodon De La Mejor Calidad En America",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: TextStyle(
                                  color: Color(0xFF42006E),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      Expanded(
                          flex: 4,
                          child: Container(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 8,
                                  child: Container(
                                    alignment: Alignment.bottomLeft,
                                    margin:
                                        EdgeInsets.only(top: 15, bottom: 13),
                                    child: Text(
                                      "\$100.115.000",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
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
                                    margin: EdgeInsets.only(top: 10),
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
                                          //TODO: Delete Product from Cart
                                        },
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
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
