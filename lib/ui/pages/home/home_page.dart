import 'package:flutter/material.dart';
import 'package:oferi/ui/widgets/category_widget.dart';
import 'package:oferi/ui/widgets/item_list.dart';
import 'package:oferi/ui/widgets/search_bar.dart';

import '../../widgets/carrousel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              const SliverAppBar(
                toolbarHeight: 35,
                backgroundColor: Color(0xFF42006E),
              ),
            ];
          },
          body: Center(
              child: ListView(
            children: const [
              SearchBar(),
              CategoryList(),
              ListItem(),
              Carousel(),
            ],
          )),
        ),
      ),
    );
  }
}
