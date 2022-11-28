import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  String searchText;
  final void Function(String)? onSubmitted;
  String? placeholder;
  final bool clear;

  SearchBar(
      {super.key,
      this.searchText = "",
      this.onSubmitted,
      this.placeholder,
      this.clear = false});

  @override
  State<SearchBar> createState() => _SearchBar();
}

class _SearchBar extends State<SearchBar> {
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: widget.searchText);
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
      placeholder: widget.placeholder,
      onSuffixTap: (() {
        setState(() {
          widget.placeholder = "";
        });
        textController.clear();
      }),
      onSubmitted: ((searchText) {
        if (widget.onSubmitted != null) {
          searchText.isNotEmpty ? widget.onSubmitted!(searchText) : null;
        }
        widget.clear ? textController.clear() : null;
        setState(() {
          widget.placeholder = searchText;
        });
      }),
    );
  }
}
