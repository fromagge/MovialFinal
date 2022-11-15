import 'package:flutter/material.dart';
import 'package:oferi/ui/widgets/Input_Widgets/category_button/category_button_widget.dart';

class CategoryList extends StatelessWidget {
  List<String> categorias = [
    "Relevancia",
    "Precio",
    "Distancia",
  ];
  final double fontsize;

  CategoryList({super.key, this.fontsize = 17});

  @override
  build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 50,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: categorias.length,
        itemBuilder: (BuildContext context, int index) {
          return CategoryButtonWidget(
            categoryName: categorias[index],
            fontsize: fontsize,
          );
        },
      ),
    );
  }
}
