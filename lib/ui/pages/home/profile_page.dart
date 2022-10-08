import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //AuthenticationController controller = Get.find();
    return Center(
        child: ElevatedButton(
      key: const Key('profileLogout'),
      child: const Text('Logout'),
      onPressed: () {
        //Get.to(() => const LoginPage());
        //controller.logout();
      },
    ));
  }
}
