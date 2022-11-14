import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final IconData? icon;
  final double? arrowSize;
  final double? iconSize;
  final double? titleSize;
  final Color? color;

  const TitleWidget(
      {super.key,
      this.title = "",
      this.icon,
      this.arrowSize = 45,
      this.color = const Color(0xFF42006E),
      this.iconSize = 40,
      this.titleSize = 30});

  @override
  build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        IconButton(
          padding: const EdgeInsets.only(bottom: 5),
          icon: const Icon(Icons.arrow_circle_left_outlined),
          iconSize: arrowSize,
          color: const Color(0xFF42006E),
          onPressed: () {
            Get.back();
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Text(
            title,
            style: TextStyle(
              fontSize: titleSize,
              fontWeight: FontWeight.bold,
              color: Color(0xFF42006E),
            ),
          ),
        ),
        Container(
          width: 20,
          padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 6),
          child: Icon(
            icon,
            color: color,
            size: iconSize,
          ),
        ),
      ],
    );
  }
}
