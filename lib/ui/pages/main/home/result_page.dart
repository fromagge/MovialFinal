import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oferi/ui/widgets/Input_Widgets/category_button/category_list_widget.dart';
import 'package:oferi/ui/widgets/product%20widgets/product_grid_card.dart';
import 'package:oferi/ui/widgets/product%20widgets/product_grid.dart';
import 'package:oferi/ui/widgets/Input_Widgets/search_bar.dart';
import 'package:oferi/ui/widgets/Input_Widgets/category_button/category_widget.dart';
import 'package:get/get.dart';

class Result extends StatelessWidget {
  const Result({Key? key, required this.search}) : super(key: key);
  final String search;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
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
                  ];
                },
                body: ListView(children: [CategoryList(), ProductGrid()]))));
  }
}
