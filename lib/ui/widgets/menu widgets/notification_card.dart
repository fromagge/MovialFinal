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
        onDismissed: (direction) {
          // Remove the item from the data source.
          //userController.deleteUser(user.id);
        },
        child: Card(
          key: Key(title),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: ListTile(
                  leading: Container(
                      height: 50.0,
                      width: 30.0,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/logo_a.jpeg"),
                            fit: BoxFit.contain),
                      )),
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
