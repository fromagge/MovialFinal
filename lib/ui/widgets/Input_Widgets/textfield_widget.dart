import 'package:flutter/material.dart';

class DefaultTextWidget extends StatelessWidget {
  String label;
  final TextInputType textInputType;
  final bool obscureText;
  final double height;
  String? Function(String?)? validator;
  FocusNode? myFocusNode;

  DefaultTextWidget({
    super.key,
    this.label = "",
    this.obscureText = false,
    this.textInputType = TextInputType.text,
    this.validator,
    this.myFocusNode,
    this.height = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.only(bottom: 5, left: 11),
              child: Text(
                label,
              )),
          TextFormField(
            obscureText: obscureText,
            keyboardType: textInputType,
            focusNode: myFocusNode,
            style: TextStyle(fontSize: 18 + 0.12 * height),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                  top: height / 2, bottom: height / 2, left: 10),
              filled: true,
              fillColor: myFocusNode != null
                  ? myFocusNode!.hasFocus
                      ? Colors.white
                      : Colors.grey.shade200
                  : Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              errorStyle: TextStyle(
                  fontSize: 13 + 0.12 * height, fontWeight: FontWeight.w400),
            ),
            validator: validator,
          ),
        ]);
  }
}
