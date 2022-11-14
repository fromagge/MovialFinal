import 'package:division/division.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:oferi/ui/widgets/menu%20widgets/notification_card.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //HomeController controller = Get.find();
    //UserController userController = Get.find();
    return Scaffold(
        body: SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 0),
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
    ));
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
      IconButton(
        padding: const EdgeInsets.only(bottom: 5),
        icon: const Icon(Icons.arrow_circle_left_outlined),
        iconSize: 45,
        color: const Color(0xFF42006E),
        onPressed: () {
          Get.back();
        },
      ),
      const Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Text("Notificaciones",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF42006E)))),
      Container(
          width: 20,
          padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 6),
          child: const Icon(
            CupertinoIcons.bell_fill,
            size: 40,
            color: Color(0xFF42006E),
          )),
    ]);
  }
}
