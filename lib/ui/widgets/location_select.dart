import 'package:division/division.dart';
import 'package:flutter/material.dart';

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
          const Icon(Icons.edit_location_outlined, size: 20),
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
