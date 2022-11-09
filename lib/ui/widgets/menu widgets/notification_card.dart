import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/entities/item.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool enable;
  const NotificationCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.enable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //UserController userController = Get.find();
    return Center(
      child: Dismissible(
        key: UniqueKey(),
        background: Container(
            color: Colors.red,
            alignment: Alignment.centerLeft,
            child: const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Borrando",
                style: TextStyle(color: Colors.white),
              ),
            )),
        onDismissed: (direction) {
          // Remove the item from the data source.
          //userController.deleteUser(user.id);
        },
        child: Card(
          key: Key(title),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: ListTile(
                  leading: Container(
                      height: 50.0,
                      width: 30.0,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/logo.png"),
                            fit: BoxFit.contain),
                      )
                      //   radius: 30.0,
                      //   backgroundColor: Colors.transparent,
                      //   child: ClipOval(child: Image.network(user.picture)),
                      ),
                  title: Text(
                    title,
                    style: const TextStyle(color: Colors.orange),
                  ),
                  subtitle: Text(
                    subtitle,
                    style: const TextStyle(color: Colors.black),
                  ),
                  onTap: onTap,
                  enabled: enable,
                ),
              ),
              TextButton(
                onPressed: () {
                  //Get.to(() => UserDetailPage(), arguments: [user, user.id]);
                },
                child: Text("more"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
