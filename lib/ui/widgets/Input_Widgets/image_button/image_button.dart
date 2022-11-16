import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  final String text;
  final String imgPath;
  final Color color;
  const ImageButton(
      {super.key,
      required this.text,
      required this.imgPath,
      this.color = const Color(0xFF42006E)});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Ink(
              decoration: const ShapeDecoration(
                shape: CircleBorder(),
              ),
              child: CircleAvatar(
                backgroundColor: color,
                radius: 50.0,
                child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Image(image: AssetImage(imgPath))),
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
