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
import 'package:oferi/ui/pages/home/result_page.dart';
import 'package:oferi/ui/widgets/menu%20widgets/notification_card.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //HomeController controller = Get.find();
    //UserController userController = Get.find();
    return CupertinoPageScaffold(
      backgroundColor: Colors.green,
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 50),
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Parent(
              style: ParentStyle()..padding(all: 10),
              child: Column(children: [title(context), notificationList()]),
            ),
          )
        ],
      ),
    );
  }

  Widget notificationList() {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 10),
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

  Widget title(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      const Icon(
        CupertinoIcons.arrow_left_circle,
        size: 40,
        color: Color(0xFF42006E),
      ),
      Txt("Notificaciones",
          style: TxtStyle()
            ..textColor(const Color(0xFF42006E))
            ..bold()
            ..margin(left: 10)
            ..fontSize(30)),
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: const Icon(
            CupertinoIcons.bell_fill,
            size: 40,
            color: Color(0xFF42006E),
          )),
    ]);
  }
}
