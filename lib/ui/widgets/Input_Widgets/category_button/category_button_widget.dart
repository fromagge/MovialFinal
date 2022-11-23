import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';

class CategoryButtonWidget extends StatelessWidget {
  final String categoryName;
  final double fontsize;
  final double sizeFactor;
  final bool isSelected;
  void Function()? onPressed;

  CategoryButtonWidget({
    super.key,
    required this.categoryName,
    this.fontsize = 17,
    this.sizeFactor = 1,
    required this.onPressed,
    required this.isSelected,
  });

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
            backgroundColor: isSelected
                ? const Color(0xFFFAF2C8)
                : Colors.white.withOpacity(0.88),
            fixedSize: Size.fromWidth(buttonWidth),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        onPressed: onPressed,
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
