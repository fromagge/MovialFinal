import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';
import 'package:oferi/ui/widgets/Input_Widgets/category_button/category_button_widget.dart';

class CategoryList extends StatefulWidget {
  final double fontsize;

  CategoryList({super.key, this.fontsize = 17});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int pressedAttentionIndex = 0;

  final List<String> categorias = [
    "Relevancia",
    "Precio",
    "Distancia",
  ];

  @override
  build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categorias.length,
        itemBuilder: (BuildContext context, int index) {
          bool pressAttention = pressedAttentionIndex == index;
          return CategoryButtonWidget(
            categoryName: categorias[index],
            fontsize: widget.fontsize,
            isSelected: pressAttention,
            onPressed: () => setState(
              () {
                pressedAttentionIndex = index;
                logInfo(pressedAttentionIndex);
              },
            ),
          );
        },
      ),
    );
  }
}
