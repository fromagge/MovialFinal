// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:oferi/ui/controllers/authentication_controller.dart';
import 'package:oferi/ui/pages/main/bottom_navbar.dart';
import 'package:oferi/ui/utils/validator.dart';
import 'package:oferi/ui/widgets/input_widgets/button_widget.dart';
import 'package:oferi/ui/widgets/input_widgets/textfield_widget.dart';
import 'package:get/get.dart';
import 'package:oferi/ui/pages/login/register_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginForm();
  }
}

class _LoginForm extends State<LoginPage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final int _nrOfNodes = 2;
  late final List<FocusNode> _focusNodes;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  AuthenticationController authenticationController = Get.find();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
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
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
        child: Center(
          child: SizedBox(
            width: 500,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  AspectRatio(
                      aspectRatio: 3.2,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage(
                            "assets/images/oferi/logo_b.jpeg",
                          ),
                          fit: BoxFit.cover,
                        )),
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: _key,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      child: Column(children: [
                        DefaultTextWidget(
                          controller: _emailController,
                          myFocusNode: _focusNodes[0],
                          label: "Correo electrónico",
                          textInputType: TextInputType.text,
                          validator: (value) =>
                              Validator.validateUserName(value ?? ""),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DefaultTextWidget(
                          controller: _passwordController,
                          myFocusNode: _focusNodes[1],
                          label: "Contraseña",
                          showPassword: true,
                          textInputType: TextInputType.text,
                          validator: (value) =>
                              Validator.validatePassword(value ?? ""),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        DefaultButtonWidget(
                            label: "Iniciar Sesión",
                            onPressed: () async {
                              FocusScope.of(context).requestFocus(FocusNode());
                              if (_key.currentState!.validate()) {
                                final form = _key.currentState;
                                form!.save();
                                if (form.validate()) {
                                  var value =
                                      await authenticationController.login(
                                          _emailController.text,
                                          _passwordController.text);

                                  if (value) {
                                    PersistentNavBarNavigator.pushNewScreen(
                                      context,
                                      screen: const NavBar(),
                                      pageTransitionAnimation:
                                          PageTransitionAnimation.fade,
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Incorrect user or password')));
                                  }
                                }
                              }
                            },
                            buttonColor: const Color(0xFF42006E)),
                        const SizedBox(
                          height: 20,
                        ),
                        DefaultButtonWidget(
                          label: "Registrarse",
                          onPressed: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            Get.to(() => const RegisterPage(),
                                duration: const Duration(milliseconds: 500),
                                transition: Transition.downToUp,
                                curve: Curves.easeInOutExpo);
                            _emailController.clear();
                            _passwordController.clear();
                          },
                          textColor: const Color(0xFF42006E),
                          buttonColor: const Color(0XFFFAF2C8),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextButton(
                          onPressed: () => {
                            //TODO: Get.to(Reset_Password_Page)
                          },
                          child: const Text(
                            "¿Olvidaste tú contraseña?",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 100, 100, 100),
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ]),
                    ),
                  )
                ]),
          ),
        ),
      ),
    ));
  }
}
