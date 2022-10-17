import 'package:flutter/material.dart';
import 'package:oferi/ui/widgets/item_list.dart';
import 'package:oferi/ui/widgets/search_bar.dart';
import 'package:oferi/ui/widgets/category_widget.dart';

class Result extends StatelessWidget {
  const Result({Key? key, required this.search}) : super(key: key);
  final String search;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: const [
          SearchBar(),
          CategoryList(),
          ListItem(
            direction: Axis.vertical,
          ),
        ],
      ),
    );
  }
}
