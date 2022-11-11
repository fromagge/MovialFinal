import 'dart:math';

import 'package:division/division.dart';
import 'package:flutter/material.dart';

final ParentStyle parentStyle = ParentStyle()
  ..alignment.center(true)
  ..offset(0, -30)
  ..maxWidth(400)
  ..padding(horizontal: 20);

final TxtStyle imageStyle = TxtStyle()
  ..width(1550)
  ..height(150)
  ..margin(bottom: 60)
  ..background.image(path: "assets/images/logo.png");

final TxtStyle headerStyle = TxtStyle()
  ..fontWeight(FontWeight.w900)
  ..margin(bottom: 30)
  ..fontSize(32);

final emailField = TextFormField(
  decoration: InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        width: 0,
        style: BorderStyle.none,
      ),
    ),
    hintStyle: TextStyle(color: Colors.grey[500]),
    hintText: "Email",
    filled: true,
    fillColor: Colors.grey[202],
  ),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }

    if (!value.contains("@")) {
      return 'Please enter a valid email';
    }
    return null;
  },
);

final TxtStyle signInButtonStyle = TxtStyle()
  ..background.color(Colors.black)
  ..bold()
  ..borderRadius(all: 10)
  ..fontSize(16)
  ..margin(all: 2)
  ..margin(top: 30)
  ..padding(vertical: 13)
  ..ripple(true)
  ..textColor(Colors.white)
  ..width(400)
  ..textAlign.center();
