import 'package:firebase_database/firebase_database.dart';

class AppUser {
  String? key;
  String email;
  String uid;
  String country;
  String names;
  String phone;
  String surnames;

  AppUser(this.key, this.country, this.names, this.surnames, this.phone,
      this.email, this.uid);

  AppUser.fromJson(DataSnapshot snapshot, Map<dynamic, dynamic> json)
      : key = snapshot.key ?? "0",
        email = json['email'] ?? "email",
        uid = json['uid'] ?? "uid",
        country = json['country'] ?? "country",
        phone = json['phone'] ?? "phone",
        names = json['names'] ?? "names",
        surnames = json['surnames'] ?? "surnames";

  toJson() {
    return {
      "email": email,
      "uid": uid,
      "country": country,
      "names": names,
      "phone": phone,
      "surnames": surnames
    };
  }
}
