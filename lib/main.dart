import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:oferi/ui/pages/home/main.dart';
import 'package:oferi/ui/pages/login/login.dart';
import 'package:oferi/ui/pages/login/confirmation.dart';

void main() {
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

  // This widget is the root of your application.
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
            primaryColor: Colors.blue,
            iconTheme: const IconThemeData(color: Colors.purpleAccent),
            inputDecorationTheme: const InputDecorationTheme(
                labelStyle: TextStyle(color: Colors.redAccent))),
        builder: EasyLoading.init(),
        home: const Scaffold(body: Home()));
  }
}
