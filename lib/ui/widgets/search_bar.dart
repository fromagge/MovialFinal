import 'package:division/division.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oferi/ui/pages/cart/checkout.dart';
import 'package:oferi/ui/pages/home/result_page.dart';
import 'package:oferi/ui/widgets/location_select.dart';

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
    return CupertinoPageScaffold(
      child: Align(
        alignment: Alignment.topCenter,
        child: Parent(
            style: ParentStyle()..padding(all: 13),
            child: Column(children: [
              const LocationSelect(),
              Row(
                children: <Widget>[
                  Expanded(
                      flex: 8,
                      child: CupertinoSearchTextField(
                          controller: textController,
                          itemSize: 16,
                          itemColor: const Color(0xFF42006E),
                          backgroundColor: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                          placeholder: 'Search',
                          onSubmitted: ((value) => Get.to(
                              () => Result(search: value),
                              duration: const Duration(milliseconds: 200),
                              transition: Transition.fadeIn,
                              curve: Curves.easeInOut)))),
                ],
              )
            ])),
      ),
    );
  }
}
