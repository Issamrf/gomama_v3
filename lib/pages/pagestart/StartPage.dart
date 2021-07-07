import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gomama_v2/pages/login/Login.dart';
import 'package:gomama_v2/pages/pagesignup/SignUp.dart';


class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            // giving the elements height
            // double.infinity make it big as my parent allows
            // while MediaQuery make it big as per the screen
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              // even space distribution
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Willkommen",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Motivationen ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/Logo.png"))),
                ),
                Column(
                  children: <Widget>[
                    // login button
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      //navigation
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Login()));
                      },
                      //  shape of login Button
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Einloggen",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ),
                    //  signup button
                    SizedBox(height: 20),
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUp()));
                      },
                      color: Color(0xff3b93c3),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Registrieren",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
