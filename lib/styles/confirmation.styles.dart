import 'package:division/division.dart';
import 'package:flutter/material.dart';

final ParentStyle parentStyle = ParentStyle()
  ..alignment.center(true)
  ..offset(0, -40)
  ..maxWidth(400)
  ..padding(horizontal: 20);

final parentInput = ParentStyle();

final headerStyle = TxtStyle()
  ..fontSize(16 * 2)
  ..bold()
  ..margin(bottom: 20);

final paragraphStyle = TxtStyle()..textAlign.center();

final inputSingleDigit = TxtStyle()
  ..width(40)
  ..height(40)
  ..textAlign.center()
  ..fontSize(30)
  ..editable(
      keyboardType:
          const TextInputType.numberWithOptions(decimal: false, signed: false))
  ..borderRadius(all: 3)
  ..maxLines(1)
  ..editable(enable: true, placeholder: "O")
  ..border(all: 1, color: Colors.grey[505]!);
