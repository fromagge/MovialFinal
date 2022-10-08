import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';
import 'package:oferi/ui/my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(
      showColors: true,
    ),
  );
  runApp(const MyApp());
}
