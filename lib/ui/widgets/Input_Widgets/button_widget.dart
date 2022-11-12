import 'package:flutter/material.dart';

class DefaultButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color textColor;
  const DefaultButtonWidget({
    super.key,
    required this.label,
    required this.onPressed,
    required this.buttonColor,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            minimumSize: Size.fromHeight(50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(70),
            ),
            foregroundColor: textColor,
            backgroundColor: buttonColor),
        child: Text(label));
  }
}
