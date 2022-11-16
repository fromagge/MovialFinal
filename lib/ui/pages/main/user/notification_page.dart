import 'package:division/division.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:oferi/ui/widgets/menu_widgets/title_widget.dart';

import 'package:oferi/ui/widgets/notification_card.dart';

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
              child: Column(children: [
                const TitleWidget(
                  title: "Notificaciones",
                  icon: CupertinoIcons.bell_fill,
                  iconSize: 35,
                ),
                notificationList(),
              ]),
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
}
