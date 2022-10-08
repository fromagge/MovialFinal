import 'package:flutter/material.dart';
import 'package:oferi/ui/widgets/home_widgets/item_card.dart';
import 'package:oferi/ui/widgets/home_widgets/search_bar.dart';
import 'package:oferi/ui/widgets/home_widgets/category_widget.dart';

class Result extends StatelessWidget {
  const Result({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          const SearchBar(),
          const CategoryList(),
          itemList(context),
        ],
      ),
    );
  }

  Widget itemList(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      crossAxisCount: 2,
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 10,
      childAspectRatio: (itemWidth / itemHeight),
      controller: ScrollController(keepScrollOffset: false),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      // Generate 100 widgets that display their index in the List.
      children: List.generate(100, (index) {
        return const Center(child: ItemCard());
      }),
    );
  }
}
