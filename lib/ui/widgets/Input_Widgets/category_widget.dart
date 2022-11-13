import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  //TODO: El array Categorias debe ir en el controlador:
  static const categorias = [
    "Relevancia",
    "Precio",
    "Cercanía",
  ];
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: categorias.length,
        itemBuilder: (BuildContext context, int index) =>
            Center(child: categoryButtonWidget(categorias[index])),
      ),
    );
  }

  Widget categoryButtonWidget(String categoryName) {
    double buttonWidth = categoryName.length * 13;
    return Container(
      padding: const EdgeInsets.only(left: 24),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFD9D9D9),
            fixedSize: Size.fromWidth(buttonWidth),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        onPressed: () => {
          //Cuando sea presionado debe mantener el focusNode encima y cambiar de color
        },
        child: Text(
          categoryName,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
