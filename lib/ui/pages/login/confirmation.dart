import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:oferi/styles/confirmation.styles.dart';
import 'package:oferi/ui/widgets/single_digit_input.dart';

// Define a custom Form widget.
class ConfirmationForm extends StatefulWidget {
  const ConfirmationForm({super.key});

  @override
  _ConfirmationForm createState() {
    return _ConfirmationForm();
  }
}

class _ConfirmationForm extends State<ConfirmationForm> {
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
                Txt("We just emailed you", style: headerStyle),
                Txt("Enter the verification code we just sent to your email",
                    style: paragraphStyle),
                Parent(
                    style: ParentStyle()
                      ..alignment.center()
                      ..margin(top: 30)
                      ..maxWidth(300),
                    child: Row(
                      children: [
                        NumberInput(label: "⬤"),
                        const Spacer(),
                        NumberInput(label: "⬤"),
                        const Spacer(),
                        NumberInput(label: "⬤"),
                        const Spacer(),
                        NumberInput(label: "⬤"),
                        const Spacer(),
                        NumberInput(label: "⬤"),
                        const Spacer(),
                        NumberInput(label: "⬤", isLast: true),
                      ],
                    ))
              ],
            )));
  }
}
