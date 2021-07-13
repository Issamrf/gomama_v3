import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gomama_v2/models/OurUser.dart';
import 'package:gomama_v2/services/Database.dart';

/// This Class have the current User informations to get them from the database.
/// it have the ability examin the credentials if the user is trying to connect to the database.
/// Author: Issam Rafiq.
class CurrentUser extends ChangeNotifier {
  OurUser currentUser = OurUser();
  OurUser get getCurrentUser => currentUser;
  FirebaseAuth auth = FirebaseAuth.instance;
  List<OurUser> ourUser = [];

  String uid;
  String name;
  String plz;
  String birth;
  String kids;
  String email;
  String city;

  Future<String> onStartUp() async {
    String returnValue = "error";
    try {
      User firebaseUser = auth.currentUser;
      if (firebaseUser != null) {
        currentUser = await Database().getUserInfo(firebaseUser.uid);
        if (currentUser != null) {
          returnValue = "success";
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return returnValue;
  }

  Future<String> signOut() async {
    String retVal = "error";
    try {
      await auth.signOut();
      currentUser = OurUser();
      retVal = "success";
    } catch (e) {
      print(e.toString());
    }
    return retVal;
  }

  Future<String> signUpUser(
    String email,
    String password,
    String plz,
    String birth,
    String kids,
    String name,
    String city,
  ) async {
    String returnValue = "error";
    OurUser user = OurUser();

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user.uid = userCredential.user.uid;
      user.email = userCredential.user.email;
      user.plz = plz;
      user.name = name;
      user.birth = birth;
      user.kids = kids;
      user.city = city;
      String returnString = await Database.createUSer(user);
      if (returnString == "success") {
        returnValue = "success";
      }
      returnValue = "success";
    } on PlatformException catch (e) {
      returnValue = e.message;
    } catch (e) {
      print(e.toString());
    }
    return returnValue;
  }

  Future<String> loginUSerWithEmail(String email, String password) async {
    String returnValue = "error";

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      currentUser = await Database().getUserInfo(auth.currentUser.uid);
      if (currentUser != null) {
        returnValue = "success";
      }
      returnValue = "success";
    } catch (e) {
      returnValue = e.message;
    }
    return returnValue;
  }

  Future<void> resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
    }
  }

  void setOurUser(List<OurUser> ourUser) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ourUser = ourUser;
      notifyListeners();
    });
  }
}
