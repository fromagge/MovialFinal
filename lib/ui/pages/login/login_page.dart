import 'package:flutter/material.dart';
import 'package:oferi/ui/pages/home/homes_screen.dart';
import 'package:oferi/ui/pages/home/main.dart';
import 'package:oferi/ui/widgets/Input_Widgets/button_widget.dart';
import 'package:oferi/ui/widgets/Input_Widgets/textfield_widget.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginForm();
  }
}

class _LoginForm extends State<LoginPage> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _key,
            autovalidateMode: AutovalidateMode.always,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: ListView(children: [
                DefaultTextWidget(
                    label: "Nombre de usuario",
                    textInputType: TextInputType.text,
                    validator: checkFieldEmpty),
                const SizedBox(height: 10),
                DefaultTextWidget(
                    label: "Contraseña",
                    obscureText: true,
                    textInputType: TextInputType.text,
                    validator: checkSafePassword),
                const SizedBox(
                  height: 10,
                ),
                DefaultButtonWidget(
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        Get.to(() => const Home());
                      }
                    },
                    label: "Confirmar")
              ]),
            )));
  }

  String? checkFieldEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return '*Llenar este campo es obligatorio';
    }
    return null;
  }

//TODO: Arreglar esta funcion de validación para contraseña con regEx para mejor seguridad.
  String? checkSafePassword(String? value) {
    if (checkFieldEmpty(value) != null) {
      return checkFieldEmpty(value);
    }

    if (value != null && value.contains("hola")) {
      return 'RIP';
    }
    return null;
  }
}
