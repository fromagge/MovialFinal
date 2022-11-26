import 'package:flutter/material.dart';
import 'package:oferi/ui/utils/validator.dart';
import 'package:oferi/ui/widgets/Input_Widgets/button_widget.dart';
import 'package:oferi/ui/widgets/Input_Widgets/textfield_widget.dart';
import 'package:oferi/ui/widgets/menu_widgets/title_widget.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  late List<TextEditingController> textcontrollers;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textcontrollers = List.generate(5, (index) => TextEditingController());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleWidget(
            title: "Editar perfil",
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Container(
              child: ListView(
                shrinkWrap: true,
                children: [
                  const Text(
                    "Info. de usuario",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 10),
                  createForm(),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  Widget createForm() {
    return Form(
      key: _key,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            DefaultTextWidget(
              label: "Nombre",
              controller: textcontrollers[0],
              validator: (value) => Validator.validateUserName(value ?? ""),
            ),
            const SizedBox(height: 8),
            DefaultTextWidget(
              label: "Apellido",
              controller: textcontrollers[1],
              validator: (value) => Validator.validateText(value ?? ""),
            ),
            const SizedBox(height: 8),
            DefaultTextWidget(
              label: "Celular",
              controller: textcontrollers[2],
              validator: (value) => Validator.validatePhoneNumber(value ?? ""),
            ),
            const SizedBox(height: 8),
            DefaultTextWidget(
              label: "Correo",
              controller: textcontrollers[3],
              validator: (value) => Validator.validateEmail(value ?? ""),
            ),
            const SizedBox(height: 8),
            DefaultTextWidget(
              label: "Contraseña",
              controller: textcontrollers[4],
              validator: (value) => Validator.validatePassword(value ?? ""),
              showPassword: true,
            ),
            const SizedBox(height: 17),
            DefaultButtonWidget(
                label: "Aplicar cambios",
                onPressed: () {
                  //TODO: UPDATE USER IN CONTROLLER
                  FocusScope.of(context).requestFocus(FocusNode());
                  if (_key.currentState!.validate()) {
                    final form = _key.currentState;
                    form!.save();
                    if (form.validate()) {
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Usuario editado exitosamente")));
                    }
                  }
                },
                buttonColor: Color(0xFF42006E))
          ],
        ),
      ),
    );
  }
}
