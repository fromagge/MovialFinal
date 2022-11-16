import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oferi/domain/entities/product.dart';
import 'package:oferi/ui/widgets/input_widgets/category_button/category_list_widget.dart';
import 'package:oferi/ui/widgets/product_widgets/product_grid_card.dart';
import 'package:oferi/ui/widgets/product_widgets/product_grid.dart';
import 'package:oferi/ui/widgets/input_widgets/search_bar.dart';
import 'package:oferi/ui/widgets/input_widgets/category_button/category_button_widget.dart';
import 'package:get/get.dart';

class Result extends StatelessWidget {
  Result({Key? key, required this.search}) : super(key: key);
  final String search;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Product product = Product(
    name: "Chaleco de Cuero Sueco Amarillo",
    category: "XD",
    imgUrl:
        "https://img.freepik.com/free-photo/bff-printed-red-hoodie_53876-105408.jpg?w=2000",
    latitude: 5,
    longitude: 10,
    seller: "Julio",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: DefaultTabController(
          length: 1,
          child: SafeArea(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: NestedScrollView(
                floatHeaderSlivers: true,
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      floating: true,
                      pinned: true,
                      toolbarHeight: 90,
                      leadingWidth: 40,
                      leading: IconButton(
                        icon: const Icon(
                          CupertinoIcons.arrow_left_circle,
                          size: 45,
                        ),
                        iconSize: 50,
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      title: SearchBar(),
                      backgroundColor: Color(0xFF42006E),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate.fixed(
                        [
                          Container(
                            color: Colors.black.withOpacity(0.9),
                            child: CategoryList(),
                          )
                        ],
                      ),
                    ),
                  ];
                },
                body:
                    //ProductGrid()
                    ListView(
                  shrinkWrap: true,
                  children: [
                    ProductGridCard(
                      product: product,
                    ),
                    ProductGridCard(
                      product: product,
                    ),
                    ProductGridCard(
                      product: product,
                    ),
                    ProductGridCard(
                      product: product,
                    ),
                    ProductGridCard(
                      product: product,
                    ),
                    ProductGridCard(
                      product: product,
                    ),
                    ProductGridCard(
                      product: product,
                    ),
                    ProductGridCard(
                      product: product,
                    ),
                    ProductGridCard(
                      product: product,
                    ),
                    ProductGridCard(
                      product: product,
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
