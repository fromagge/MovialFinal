import 'package:flutter/material.dart';
import 'package:division/division.dart';
import 'package:oferi/ui/widgets/input_widgets/button_widget.dart';
import 'package:oferi/ui/widgets/input_widgets/textfield_widget.dart';
import 'package:get/get.dart';
import 'package:oferi/ui/widgets/menu_widgets/title_widget.dart';
import 'package:oferi/ui/utils/validator.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RegisterForm();
  }
}

class _RegisterForm extends State<RegisterPage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool? checked = true;
  // Número de elementos al cual deseas concentrarte
  final int _nrOfNodes = 7;
  late final List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();

    _focusNodes = List.generate(_nrOfNodes, (_) => FocusNode());

    for (var node in _focusNodes) {
      node.addListener(() {
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    _focusNodes.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double divider = 10;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleWidget(
                    title: "¡Únete a Oferi!",
                    titleSize: 35,
                    arrowSize: 50,
                  ),
                  Form(
                    key: _key,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          DefaultTextWidget(
                            myFocusNode: _focusNodes[0],
                            label: "Nombre(s)",
                            textInputType: TextInputType.text,
                            validator: (value) =>
                                Validator.validateText(value ?? ""),
                          ),
                          const SizedBox(
                            height: divider,
                          ),
                          DefaultTextWidget(
                            myFocusNode: _focusNodes[1],
                            label: "Apellidos",
                            showPassword: true,
                            textInputType: TextInputType.text,
                            validator: (value) =>
                                Validator.validateText(value ?? ""),
                          ),
                          const SizedBox(
                            height: divider,
                          ),
                          DefaultTextWidget(
                            myFocusNode: _focusNodes[2],
                            label: "Celular",
                            textInputType: TextInputType.text,
                            validator: (value) =>
                                Validator.validatePhoneNumber(value ?? ""),
                          ),
                          const SizedBox(
                            height: divider,
                          ),
                          DefaultTextWidget(
                            myFocusNode: _focusNodes[3],
                            label: "Correo Electrónico",
                            textInputType: TextInputType.text,
                            validator: (value) =>
                                Validator.validateEmail(value ?? ""),
                          ),
                          const SizedBox(
                            height: divider,
                          ),
                          DefaultTextWidget(
                            myFocusNode: _focusNodes[4],
                            label: "País/Ciudad",
                            textInputType: TextInputType.text,
                            validator: (value) =>
                                Validator.validateText(value ?? ""),
                          ),
                          const SizedBox(
                            height: divider,
                          ),
                          DefaultTextWidget(
                            myFocusNode: _focusNodes[5],
                            label: "Nombre de usuario",
                            textInputType: TextInputType.text,
                            validator: (value) =>
                                Validator.validateUserName(value ?? ""),
                          ),
                          const SizedBox(
                            height: divider,
                          ),
                          DefaultTextWidget(
                            myFocusNode: _focusNodes[6],
                            label: "Establecer una contraseña",
                            showPassword: true,
                            textInputType: TextInputType.text,
                            validator: (value) =>
                                Validator.validatePassword(value ?? ""),
                          ),
                          const SizedBox(
                            height: divider,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Checkbox(
                                  activeColor: const Color(0xFF42006E),
                                  value: checked,
                                  onChanged: (newValue) {
                                    setState(() {
                                      //TODO: Controlador de checked para notificaciones
                                      checked = newValue;
                                    });
                                  }),
                              const SizedBox(
                                  width: 250,
                                  child: Text(
                                    "Deseo recibir notificaciones sobre ofertas y demás temas de interes.",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color:
                                            Color.fromARGB(255, 100, 100, 100)),
                                    maxLines: 2,
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: divider + 7,
                          ),
                          DefaultButtonWidget(
                              label: "Registrarme",
                              onPressed: () {
                                if (_key.currentState!.validate()) {
                                  //TODO: Confirmar Registro en base de datos.
                                  //TODO: Reparar el metodo de dispose para que no lance error cuando se cambia de pagina y evitar
                                  // memory leaks.
                                  //dispose();
                                }
                              },
                              buttonColor: const Color(0xFF42006E)),
                          const SizedBox(
                            height: divider * 2,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget title(BuildContext context) {
    return Parent(
        style: ParentStyle()
          ..padding(bottom: 12)
          ..ripple(true),
        child: Row(children: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_circle_left_outlined),
            iconSize: 50,
            color: const Color(0xFF42006E),
            onPressed: () {
              Get.back();
            },
          ),
          Txt("¡Únete a Oferi!",
              style: TxtStyle()
                ..textColor(const Color(0xFF42006E))
                ..bold()
                ..fontSize(42)),
        ]));
  }
}
