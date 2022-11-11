// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA0FW322NSRTT6t6DhcQyR1low_pEw7IT0',
    appId: '1:666453903271:web:6e1ed275e7c31456d89882',
    messagingSenderId: '666453903271',
    projectId: 'oferi-final',
    authDomain: 'oferi-final.firebaseapp.com',
    storageBucket: 'oferi-final.appspot.com',
    measurementId: 'G-Q83HBCR6GR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDV1FMHY0twH_8VevGEgSbAucYZJrZ1f3I',
    appId: '1:666453903271:android:66153e272e82e714d89882',
    messagingSenderId: '666453903271',
    projectId: 'oferi-final',
    storageBucket: 'oferi-final.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCxiJ7C-Rn5F8FshHr4Q23PuyKFbzEL5iw',
    appId: '1:666453903271:ios:00de2a34952d175fd89882',
    messagingSenderId: '666453903271',
    projectId: 'oferi-final',
    storageBucket: 'oferi-final.appspot.com',
    androidClientId: '666453903271-mcu3tnbqrfe1guqkt3t801nurj5e97f9.apps.googleusercontent.com',
    iosClientId: '666453903271-09naak68glokbip41rrjajto6lb713jt.apps.googleusercontent.com',
    iosBundleId: 'com.example.oferi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCxiJ7C-Rn5F8FshHr4Q23PuyKFbzEL5iw',
    appId: '1:666453903271:ios:00de2a34952d175fd89882',
    messagingSenderId: '666453903271',
    projectId: 'oferi-final',
    storageBucket: 'oferi-final.appspot.com',
    androidClientId: '666453903271-mcu3tnbqrfe1guqkt3t801nurj5e97f9.apps.googleusercontent.com',
    iosClientId: '666453903271-09naak68glokbip41rrjajto6lb713jt.apps.googleusercontent.com',
    iosBundleId: 'com.example.oferi',
  );
}
