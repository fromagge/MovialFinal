import 'package:flutter/material.dart';
import 'package:oferi/ui/widgets/category_widget.dart';
import 'package:oferi/ui/widgets/item_list.dart';
import 'package:oferi/ui/widgets/search_bar.dart';
import 'package:flutter/cupertino.dart';

import '../../widgets/carrousel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: const [SearchBar(), CategoryList(), ListItem(), Carousel()]);
  }
}
