import 'package:division/division.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:oferi/ui/pages/login/login_page.dart';
import 'package:oferi/ui/pages/main/cart/checkout.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => const LoginPage()),
            (Route<dynamic> route) => false);
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("LogOut Correto")));
      },
      child: const Text("Log Out"),
    ));
  }
}
