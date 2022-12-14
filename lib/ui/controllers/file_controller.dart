import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:nanoid/nanoid.dart';

Future<String> uploadFileToServer(File f) async {
  String imageId = nanoid(64);
  final storageRef = FirebaseStorage.instance.ref().child('public/$imageId');

  await storageRef.putFile(f);

  return await storageRef.getDownloadURL();
}
