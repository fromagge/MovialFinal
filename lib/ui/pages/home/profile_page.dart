import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oferi/ui/pages/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //AuthenticationController controller = Get.find();
    return Center(
        child: ElevatedButton(
      key: const Key('profileLogout'),
      child: const Text('Logout'),
      onPressed: () async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', false);

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginForm()));
      },
    ));
  }
}
