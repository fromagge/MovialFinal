import 'package:flutter/material.dart';

class CategoryButtonWidget extends StatelessWidget {
  final String categoryName;
  final double fontsize;
  final double sizeFactor;

  const CategoryButtonWidget(
      {super.key,
      required this.categoryName,
      this.fontsize = 17,
      this.sizeFactor = 1});

  @override
  build(BuildContext context) {
    double buttonWidth = sizeFactor * (fontsize + categoryName.length * 12);

    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.05),
          blurRadius: 1,
          spreadRadius: 0.1,
          offset: const Offset(0, 3),
        )
      ]),
      margin: const EdgeInsets.all(3.5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white.withOpacity(0.88),
            fixedSize: Size.fromWidth(buttonWidth),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        onPressed: () => {
          //Cuando sea presionado debe mantener el focusNode encima y cambiar de color
        },
        child: Text(
          categoryName,
          style: TextStyle(
            fontSize: fontsize,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
