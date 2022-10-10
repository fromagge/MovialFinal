import 'package:division/division.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oferi/ui/pages/home/result.dart';
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
    textController = TextEditingController();
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
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        placeholder: 'Search',
                        onSubmitted: ((value) => Get.to(() => const Result())),
                      )),
                  const Expanded(flex: 1, child: Icon(Icons.shopping_cart))
                ],
              )
            ])),
      ),
    );
  }
}
