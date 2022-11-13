import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  final String text;

  const ImageButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Ink(
              decoration: const ShapeDecoration(
                color: Colors.amber,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: const Icon(Icons.brush),
                iconSize: 85,
                color: Colors.white,
                onPressed: () {},
              )),
          Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
