import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oferi/ui/pages/home_page/result.dart';

class SearchBar_Widget extends StatefulWidget {
  const SearchBar_Widget({super.key});
  @override
  State<SearchBar_Widget> createState() => searchBar();
}

class searchBar extends State<SearchBar_Widget> {
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: 'initial text');
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: CupertinoSearchTextField(
            controller: textController,
            itemSize: 32,
            suffixIcon: const Icon(
              Icons.shopping_cart,
              size: 35,
            ),
            style: const TextStyle(fontSize: 22),
            placeholder: 'Search',
            onSubmitted: ((value) => Get.to(() => Result())),
          ),
        ),
      ),
    );
  }
}
