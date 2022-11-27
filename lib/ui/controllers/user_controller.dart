import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'authentication_controller.dart';

// Controlador usado para manejar los usuarios del chat
class UserController extends GetxController {
  // lista en la que se almacenan los uaurios, la misma es observada por la UI
  var _users = <User>[].obs;

  final databaseRef = FirebaseDatabase.instance.ref();

  late StreamSubscription<DatabaseEvent> newEntryStreamSubscription;

  late StreamSubscription<DatabaseEvent> updateEntryStreamSubscription;

  // devolvemos a la UI todos los usuarios excepto el que está logeado en el sistema
  // esa lista será usada para la pantalla en la que listan los usuarios con los que se
  // puede comenzar una conversación
  get users {
    AuthenticationController authenticationController = Get.find();
    return _users
        .where((entry) => entry.uid != authenticationController.getUid())
        .toList();
  }

  get allUsers => _users;

  // método para crear un nuevo usuario
  Future<void> createUser(names, surnames, phone, country, email, uid) async {
    logInfo(
        "CreateUser --> Creating user in realTime for $names, $surnames, $phone, $country, $email and $uid");
    try {
      await databaseRef.child('userList').push().set({
        'names': names,
        'surnames': surnames,
        'phone': phone,
        'country': country,
        'email': email,
        'uid': uid
      });
    } catch (error) {
      logError(error);
      return Future.error(error);
    }
  }

  Future<void> updateUser(names, surnames, phone, country, email, uid) async {
    try {
      var currentUser = FirebaseAuth.instance.currentUser;
      FirebaseDatabase.instance.ref("-Users/${currentUser!.uid}").update({
        'names': names,
        'surnames': surnames,
        'phone': phone,
        'country': country,
        'email': email,
      });
    } catch (error) {
      logError(error);
      return Future.error(error);
    }
  }
}
