import 'package:division/division.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styles/colors.dart';

class LocationSelect extends StatefulWidget {
  const LocationSelect({super.key});
  @override
  State<LocationSelect> createState() => _LocationSelect();
}

class _LocationSelect extends State<LocationSelect> {
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: 'Search');
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
        style: ParentStyle()
          ..padding(bottom: 12)
          ..ripple(true),
        child: Row(children: <Widget>[
          const Icon(CupertinoIcons.location_solid,
              size: 28, color: Color(0xFF42006E)),
          Txt("Barranquilla",
              style: TxtStyle()
                ..bold()
                ..margin(left: 5)
                ..fontSize(22)),
          Txt(" ▼",
              style: TxtStyle()
                ..padding(top: 3)
                ..fontSize(12)
                ..textAlign.end())
        ]));
  }
}
