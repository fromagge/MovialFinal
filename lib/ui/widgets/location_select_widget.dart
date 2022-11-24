import 'package:division/division.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oferi/ui/pages/main/home/notification_page.dart';
import '../styles/colors.dart';

class LocationSelectWidget extends StatefulWidget {
  const LocationSelectWidget({super.key});
  @override
  State<LocationSelectWidget> createState() => _LocationSelect();
}

class _LocationSelect extends State<LocationSelectWidget> {
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
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
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
                    ..textAlign.end()),
              Container(
                padding: const EdgeInsets.only(left: 145),
                child: IconButton(
                  icon: const Icon(
                    size: 30,
                    CupertinoIcons.bell_fill,
                    color: Color(0xFF42006E),
                  ),
                  onPressed: () {
                    Get.to(() => const NotificationPage());
                  },
                ),
              )
            ]));
  }
}
