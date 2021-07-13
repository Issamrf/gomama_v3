import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gomama_v2/states/Utils.dart';

///our User class where all variables needed in the app
///Author: Issam Rafiq
class OurUserField {
  static const createdTime = 'createdTime';
}

class OurUser {
  String uid;
  String name;
  String plz;
  String birth;
  String kids;
  String email;
  String city;
  String about;
  Timestamp accountCreated;
  DateTime createdTime;

  OurUser({
    this.uid,
    this.name,
    this.plz,
    this.birth,
    this.kids,
    this.email,
    this.city,
    this.about = "",
    this.accountCreated,
    this.createdTime,
  });

  static OurUser fromJson(Map<String, dynamic> json) => OurUser(
        createdTime: Utils.toDateTime(json['createdTime']),
        name: json["fullName"],
        plz: json["plz"],
        birth: json["birthday"],
        kids: json["kid"],
        email: json["email"],
        city: json["city"],
        about: json["about"],
      );

  Map<String, dynamic> toJson() => {
        'accountCreated': Timestamp.now(),
        "fullName": name,
        "plz": plz,
        "birthday": birth,
        "kid": kids,
        "email": email,
        "city": city,
        "about": about = "",
      };
}
