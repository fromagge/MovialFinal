import 'package:division/division.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oferi/ui/pages/main/cart/checkout.dart';
import 'package:oferi/ui/pages/main/home/result_page.dart';

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
    textController = TextEditingController(text: "");
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: searchBarWidget(),
    );
  }

  Widget searchBarWidget() {
    return CupertinoSearchTextField(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        controller: textController,
        prefixIcon: const Icon(
          Icons.search_rounded,
          size: 40,
        ),
        itemColor: const Color(0xFF42006E),
        style: const TextStyle(
          fontSize: 20,
        ),
        placeholder: 'Buscar',
        onSubmitted: ((value) => Get.to(
            () => Result(
                  //TODO: guardar value en controlador
                  search: value,
                ),
            duration: const Duration(milliseconds: 200),
            transition: Transition.fadeIn,
            curve: Curves.easeInOut)));
  }
}
