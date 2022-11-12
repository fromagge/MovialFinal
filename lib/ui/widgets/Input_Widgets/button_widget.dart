import 'package:flutter/material.dart';

class DefaultButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const DefaultButtonWidget({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(label),
        style: ElevatedButton.styleFrom(
            shape: StadiumBorder(), backgroundColor: Color(0xFF42006E)));
  }
}
