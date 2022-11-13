import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oferi/ui/widgets/Input_Widgets/category_button/category_list_widget.dart';
import 'package:oferi/ui/widgets/product%20widgets/product_card.dart';
import 'package:oferi/ui/widgets/product%20widgets/product_list.dart';
import 'package:oferi/ui/widgets/Input_Widgets/search_bar.dart';
import 'package:oferi/ui/widgets/Input_Widgets/category_button/category_widget.dart';
import 'package:get/get.dart';

class Result extends StatelessWidget {
  const Result({Key? key, required this.search}) : super(key: key);
  final String search;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            toolbarHeight: 150,
            leadingWidth: 30,
            leading: IconButton(
              icon: Icon(CupertinoIcons.arrow_left_circle),
              iconSize: 45,
              onPressed: () {
                Get.back();
              },
            ),
            title: Container(
              child: Column(
                children: [
                  SearchBar(),
                  CategoryList(),
                ],
              ),
            ),
            backgroundColor: Color(0xFF42006E),
          ),
        ];
      },
      body: ListProduct(),
    );
  }
}
