import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'user_controller.dart';

// este controlador esconde los detalles de la implementación de firebase
class AuthenticationController extends GetxController {
  final databaseReference = FirebaseDatabase.instance.ref();

  // método usado para logearse en la aplicación
  Future<bool> login(email, password) async {
    logInfo("Auth Controller --> Login de Usuario");
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException {
      return false;
    }
  }

  // método usado para crear un usuario
  Future<bool> signup(names, surnames, phone, country, email, password) async {
    try {
      logInfo("Auth Controller --> Registro de Usuario");
      // primero creamos el usuario en el sistema de autenticación de firebase
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      UserController userController = Get.find();

      // después creamos el usuario en la base de datos de tiempo real usando el
      // userController
      await userController.createUser(
          names, surnames, phone, country, email, userCredential.user!.uid);
      return true;
    } on FirebaseAuthException {
      return false;
    }
  }

  // método usado para hacer el signOut
  logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      return Future.error("Logout error");
    }
  }

  String userEmail() {
    String email = FirebaseAuth.instance.currentUser!.email ?? "a@a.com";
    return email;
  }

  String getUid() {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return uid;
  }
}
