import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loggy/loggy.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:oferi/ui/pages/home/main.dart';
import 'package:oferi/ui/pages/loading/index.dart';
import 'package:oferi/ui/pages/login/login.dart';
import 'package:oferi/ui/pages/login/confirmation.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
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
    ..maskColor = Colors.blue.withOpacity(0.5)
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

    return MaterialApp(
        title: 'Oferi',
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.red,
              statusBarIconBrightness:
                  Brightness.dark, // For Android (dark icons)
              statusBarBrightness: Brightness.light, // For iOS (dark icons)
            )),
            primaryColor: Colors.blue,
            iconTheme: const IconThemeData(color: Colors.purpleAccent),
            inputDecorationTheme: const InputDecorationTheme(
                labelStyle: TextStyle(color: Colors.redAccent))),
        builder: EasyLoading.init(),
        home: FutureBuilder(
          future: SharedPreferences.getInstance(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                EasyLoading.show();
                return const LoaderPage();

              case ConnectionState.active:
              case ConnectionState.done:
                if (snapshot.hasData) {
                  EasyLoading.dismiss();
                  if (snapshot.data?.getBool("isLoggedIn") ?? false) {
                    return const Home();
                  }
                  return const LoginForm();
                }

                return const Txt("Fatal error");
              default:
                return const Txt("Fatal error");
            }
          },
        ));
  }
}
