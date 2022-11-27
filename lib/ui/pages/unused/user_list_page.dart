import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //HomeController controller = Get.find();
    //UserController userController = Get.find();
    return Scaffold(
      appBar: AppBar(title: const Text("User list"), actions: <Widget>[
        IconButton(
            key: const Key('deleteAllButton'),
            onPressed: () {
              //userController.deleteAll();
            },
            icon: const Icon(Icons.delete))
      ]),
      /*floatingActionButton: GetX<HomeController>(
        builder: (controller) {
          return FloatingActionButton(
            key: Key('addUserButton'),
            child: Icon(controller.connection
                ? Icons.add
                : Icons.portable_wifi_off_rounded),
            onPressed: () async {
              if (controller.connection) {
               // await userController.addUser();
              } else {
                Get.snackbar('Refresh failed!', "Can't get users",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.red);
              }
            },
          );
        },
      )*/
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        //child: _getXlistView(),
      ),
    );
  }

  /* Widget _getXlistView() {
   UserController userController = Get.find();
    return Obx(
      () => ListView.builder(
        itemCount: userController.users.length,
        itemBuilder: (context, index) {
          final user = userController.users[index];
          return ListItem(user);
        },
      ),
    );
  }
}*/
}
