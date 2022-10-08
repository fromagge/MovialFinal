import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oferi/ui/pages/home_page/result.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});
  @override
  State<SearchBar> createState() => _SearchBar();
}

class _SearchBar extends State<SearchBar> {
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
