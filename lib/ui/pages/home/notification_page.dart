import 'package:division/division.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oferi/main.dart';
import 'package:oferi/ui/pages/home/homes_screen.dart';
import 'package:oferi/ui/pages/home/menu_page.dart';
import 'package:oferi/ui/pages/home/profile_page.dart';
import 'package:oferi/ui/widgets/menu%20widgets/notification_card.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //HomeController controller = Get.find();
    //UserController userController = Get.find();
    return ListView(children: [
      CupertinoPageScaffold(
          child: Align(
        alignment: Alignment.topCenter,
        child: Parent(
          style: ParentStyle()..padding(all: 13),
          child: Column(children: [menuTitle(context), notificationList()]),
        ),
      ))
    ]);
  }

  Widget notificationList() {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 20,
      itemBuilder: (context, index) {
        return NotificationCard(
          title: "Titulo de Notificacion",
          subtitle: "Subtitulo de Notificacion",
          enable: true,
          onTap: () => {},
        );
      },
    );
    //);
  }

  Widget menuTitle(BuildContext context) {
    return Parent(
        style: ParentStyle()
          ..padding(bottom: 12)
          ..ripple(true),
        child: Row(children: <Widget>[
          const Icon(Icons.notifications, size: 20),
          Txt("Notificaciones",
              style: TxtStyle()
                ..bold()
                ..margin(left: 5)
                ..fontSize(22)),
        ]));
  }
}
