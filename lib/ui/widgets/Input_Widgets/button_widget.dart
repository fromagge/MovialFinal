import 'package:flutter/material.dart';

class DefaultButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color textColor;
  final EdgeInsets edgeInset;
  const DefaultButtonWidget({
    super.key,
    required this.label,
    required this.onPressed,
    required this.buttonColor,
    this.textColor = Colors.white,
    this.edgeInset = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: edgeInset,
        child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(70),
                ),
                foregroundColor: textColor,
                backgroundColor: buttonColor),
            child: Text(label)));
  }
}
