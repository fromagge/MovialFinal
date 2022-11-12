import 'package:oferi/ui/pages/loading/splass_screen_page.dart';
import 'package:oferi/ui/pages/login/login_page.dart';

import 'firebase_options.dart';
import 'package:division/division.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:oferi/ui/pages/home/main.dart';
import 'package:oferi/ui/pages/loading/loader_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final prefs = await SharedPreferences.getInstance();

  await prefs.setBool('isLoggedIn', false);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark));
  runApp(const Oferi());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 1000)
    ..indicatorType = EasyLoadingIndicatorType.dualRing
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.orange.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

class Oferi extends StatelessWidget {
  const Oferi({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    Loggy.initLoggy(
      logPrinter: const PrettyPrinter(
        showColors: true,
      ),
    );

    return GetMaterialApp(
        title: 'Oferi',
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness:
                  Brightness.dark, // For Android (dark icons)
              statusBarBrightness: Brightness.light, // For iOS (dark icons)
            )),
            primaryColor: Colors.purple,
            inputDecorationTheme: const InputDecorationTheme(
                labelStyle: TextStyle(color: Colors.redAccent))),
        builder: EasyLoading.init(),
        home: FutureBuilder(
          future: SharedPreferences.getInstance(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                EasyLoading.show();
                return const LoaderWidget();

              case ConnectionState.active:
              case ConnectionState.done:
                if (snapshot.hasData) {
                  EasyLoading.dismiss();

                  if (snapshot.data?.getBool("isLoggedIn") ?? false) {
                    return const Home();
                  }
                  return SplashScreen();
                }

                return const Txt("Fatal error");
              default:
                return const Txt("Fatal error");
            }
          },
        ));
  }
}
