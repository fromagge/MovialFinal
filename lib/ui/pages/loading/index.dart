import 'package:division/division.dart';
import 'package:flutter/material.dart';

class LoaderPage extends StatelessWidget {
  const LoaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Parent(style: ParentStyle()));
  }
}
