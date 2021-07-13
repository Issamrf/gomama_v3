import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gomama_v2/pages/pagescreen/Menu.dart';
import 'package:gomama_v2/pages/pagestart/StartPage.dart';

///in this Class We can Verify the User Email
///Author: Issam Rafiq
class Verification extends StatefulWidget {
  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final auth = FirebaseAuth.instance;

  User user;
  Timer timer;

  Future<void> checkEmailVerified() async {
    user = auth.currentUser;
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Menu()),
      );
    }
  }

  @override
  void initState() {
    user = auth.currentUser;
    user.sendEmailVerification();

    timer = Timer.periodic(Duration(seconds: 5), (timer) {});
    checkEmailVerified();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child:
                Text('An email has been sent to ${user.email} please verify'),
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            child: Text("Go to LOGIN "),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => StartPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
