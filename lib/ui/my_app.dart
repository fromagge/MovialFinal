import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oferi/ui/pages/home_page/content.dart';

//import 'controllers/user_controller.dart';
//import 'pages/user_list_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Get.put(UserController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.blue,
          iconTheme: const IconThemeData(color: Colors.purpleAccent),
          inputDecorationTheme: const InputDecorationTheme(
              labelStyle: TextStyle(color: Colors.redAccent))),
      home: Content(),
    );
  }
}
