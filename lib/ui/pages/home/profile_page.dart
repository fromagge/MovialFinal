import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Txt("Logout",
            gesture: Gestures()
              ..onTap(() async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setBool('isLoggedIn', false);

                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              }),
            style: TxtStyle()
              ..borderRadius(all: 16)
              ..textColor(Colors.white)
              ..fontSize(24)
              ..background.color(Colors.black)
              ..padding(vertical: 20, horizontal: 30)));
  }
}
