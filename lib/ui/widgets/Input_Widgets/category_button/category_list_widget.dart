import 'package:flutter/material.dart';
import 'package:oferi/ui/widgets/Input_Widgets/category_button/category_widget.dart';

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
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      height: 50,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: categorias.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: categoryButtonWidget(
              categoryName: categorias[index],
              fontsize: fontsize,
            ),
          );
        },
      ),
    );
  }
}
