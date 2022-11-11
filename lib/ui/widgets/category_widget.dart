import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  //TODO: El arreglo Categorias debe ir en el controlador:
  static const categorias = ["Precio", "Cercanía", "Calidad"];
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
    double buttonWidth = categoryName.length * 14;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFD9D9D9),
            fixedSize: Size.fromWidth(buttonWidth),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        onPressed: () => {},
        child: Text(
          categoryName,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
