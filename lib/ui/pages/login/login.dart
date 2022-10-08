import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:oferi/styles/login.styles.dart';

// Define a custom Form widget.
class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginForm createState() {
    return _LoginForm();
  }
}

class _LoginForm extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Parent(
        style: parentStyle,
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Txt("", style: imageStyle),
                Txt("Log in or sign up", style: headerStyle),
                Container(
                    constraints:
                        const BoxConstraints(minWidth: 100, maxWidth: 400),
                    child: emailField),
                Txt(
                  "Continue",
                  style: signInButtonStyle,
                  gesture: Gestures()
                    ..onTap(() {
                      if (_formKey.currentState!.validate()) {}
                    }),
                )
              ],
            )));
  }
}
