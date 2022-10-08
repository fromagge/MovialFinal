import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oferi/ui/pages/home/result.dart';
import 'package:oferi/ui/widgets/category_widget.dart';
import 'package:oferi/ui/widgets/item_card.dart';
import 'package:oferi/ui/widgets/search_bar.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: const [
      SearchBar(),
      CategoryList(),
      ItemCard(),
    ]);
  }
}
