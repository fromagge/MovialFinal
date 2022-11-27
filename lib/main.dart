import 'package:oferi/domain/entities/product.dart';
import 'package:oferi/ui/controllers/authentication_controller.dart';
import 'package:oferi/ui/controllers/cart_controller.dart';
import 'package:oferi/ui/controllers/favorite_controller.dart';
import 'package:oferi/ui/controllers/product_controller.dart';
import 'package:oferi/ui/controllers/purchase_controller.dart';
import 'package:oferi/ui/controllers/user_controller.dart';
import 'package:oferi/ui/pages/loading/loading_page.dart';
import 'package:oferi/ui/pages/login/login_page.dart';
import 'package:oferi/ui/pages/login/register.dart';
import 'firebase_options.dart';
import 'package:division/division.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:oferi/ui/pages/main/bottom_navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loggy/loggy.dart';

void main() async {
  Loggy.initLoggy();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final prefs = await SharedPreferences.getInstance();

  await prefs.setBool('isLoggedIn', false);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark));
  runApp(const Oferi());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 1000)
    ..indicatorType = EasyLoadingIndicatorType.dualRing
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 50.0
    ..radius = 20.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.orange.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

class Oferi extends StatelessWidget {
  const Oferi({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductController());
    Get.put(UserController());
    Get.put(AuthenticationController());
    Get.put(CartController());
    Get.put(PurchaseController());
    Get.put(FavoriteController());

    WidgetsFlutterBinding.ensureInitialized();
    Loggy.initLoggy(
      logPrinter: const PrettyPrinter(
        showColors: true,
      ),
    );

    return GetMaterialApp(
      title: 'Oferi',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.dark, // For iOS (dark icons)
        )),
        primaryColor: Colors.purple,
      ),
      builder: EasyLoading.init(),
      home: FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const LoadingPage();

            case ConnectionState.done:
              if (snapshot.hasData) {
                // EasyLoading.dismiss();

                if (snapshot.data?.getBool("isLoggedIn") ?? false) {
                  return const NavBar();
                }
                return const LoginPage();
              }

              return const Txt("Fatal error");
            default:
              return const Txt("Fatal error");
          }
        },
      ),
    );
  }
}
