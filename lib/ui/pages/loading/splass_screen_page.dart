import 'dart:async';
import 'package:flutter/material.dart';
import 'package:oferi/ui/pages/login/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends State<SplashScreen> {
  //TODO: Asignar tiempo en base a la conexión de la base de datos
  int milliseconds = 2000;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  startTime() async {
    var duration = Duration(milliseconds: milliseconds);
    return Timer(duration, pushReplacement);
  }

  pushReplacement() {
    if (mounted) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }

  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3B166E),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/images/logo_a.jpeg"),
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            const Text(
              "Cargando",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            const CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 3,
              color: Color(0xFFFF545F),
            )
          ],
        ),
      ),
    );
  }
}
