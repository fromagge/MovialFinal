import 'package:flutter/material.dart';

class categoryButtonWidget extends StatelessWidget {
  FocusNode? myFocusNode;
  final String categoryName;
  final double fontsize;
  categoryButtonWidget(
      {super.key, required this.categoryName, this.fontsize = 17});

  @override
  build(BuildContext context) {
    double buttonWidth = fontsize + categoryName.length * 12;

    return Container(
      padding: EdgeInsets.only(left: 2, right: 8),
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
          style: TextStyle(
            fontSize: fontsize,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
