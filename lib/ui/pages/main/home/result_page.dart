import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oferi/ui/widgets/item_list.dart';
import 'package:oferi/ui/widgets/Input_Widgets/search_bar.dart';
import 'package:oferi/ui/widgets/category_widget.dart';

class Result extends StatelessWidget {
  const Result({Key? key, required this.search}) : super(key: key);
  final String search;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFF42006E)),
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: const [
            SearchBar(),
            CategoryList(),
            ListItem(
              direction: Axis.vertical,
            ),
          ],
        ),
      ),
    );
  }
}
