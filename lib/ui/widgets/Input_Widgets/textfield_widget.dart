import 'package:flutter/material.dart';

class DefaultTextWidget extends StatelessWidget {
  final String label;
  final TextInputType textInputType;
  final bool obscureText;
  String? Function(String?)? validator;

  DefaultTextWidget({
    super.key,
    required this.label,
    this.obscureText = false,
    required this.textInputType,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
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
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  errorStyle: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
                validator: validator,
              ),
            ]));
  }
}
