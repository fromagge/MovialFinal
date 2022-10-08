import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:oferi/ui/pages/home/main.dart';
import 'package:oferi/ui/pages/loading/index.dart';

class NumberInput extends StatelessWidget {
  NumberInput({
    required this.label,
    this.isLast = false,
    this.controller,
    this.value,
    this.onChanged,
    this.error,
    this.icon,
    this.allowDecimal = false,
  });

  final TextEditingController? controller;
  final String? value;
  final String label;
  final Function? onChanged;
  final String? error;
  final Widget? icon;
  final bool allowDecimal;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(
            minWidth: 40, maxWidth: 40, minHeight: 40, maxHeight: 40),
        width: 40,
        height: 40,
        child: TextFormField(
          onFieldSubmitted: (value) {
            if (isLast) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoaderPage()),
              );

              EasyLoading.show(status: 'Loading...').then(
                (value) =>
                    MaterialPageRoute(builder: (context) => const Home()),
              );
            }
          },
          controller: controller,
          initialValue: value,
          onChanged: onChanged as void Function(String)?,
          keyboardType: TextInputType.numberWithOptions(decimal: allowDecimal),
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(_getRegexString())),
            TextInputFormatter.withFunction(
              (oldValue, newValue) => newValue.copyWith(
                text: newValue.text.replaceAll('.', ','),
              ),
            ),
          ],
          style: const TextStyle(fontSize: 26),
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(2.0),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[100]!),
              borderRadius: BorderRadius.circular(5.0),
            ),
            hintText: label,
            hintStyle: const TextStyle(
                fontSize: 26, fontWeight: FontWeight.w600, color: Colors.grey),
            errorText: error,
            icon: icon,
          ),
        ));
  }

  String _getRegexString() => r'[0-9]';
}
