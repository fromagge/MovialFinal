import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) =>
            Center(child: categoryButtonWidget(index.toString())),
      ),
    );
  }

  Widget categoryButtonWidget(String a) {
    return Row(children: [
      const SizedBox(
        width: 15,
        height: 20,
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black26,
            fixedSize: const Size.fromWidth(100)),
        onPressed: () => {},
        child: Text('Categoria $a'),
      ),
    ]);
  }
}
