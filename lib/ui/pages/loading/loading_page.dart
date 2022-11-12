import 'dart:async';
import 'package:flutter/material.dart';
import 'package:oferi/ui/pages/login/login_page.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoadingState();
  }
}

class LoadingState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
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
