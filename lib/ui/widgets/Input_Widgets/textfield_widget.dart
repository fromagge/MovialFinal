import 'package:flutter/material.dart';

class DefaultTextWidget extends StatelessWidget {
  String label;
  final TextInputType textInputType;
  final bool obscureText;
  String? Function(String?)? validator;
  FocusNode? myFocusNode;

  DefaultTextWidget({
    super.key,
    required this.label,
    this.obscureText = false,
    required this.textInputType,
    required this.validator,
    this.myFocusNode,
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
            decoration: InputDecoration(
              filled: true,
              fillColor:
                  myFocusNode!.hasFocus ? Colors.white : Color(0XFFD9D9D9),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              errorStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            validator: validator,
          ),
        ]);
  }
}
