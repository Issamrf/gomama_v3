import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gomama_v2/pages/pagescreen/Menu.dart';
import 'package:gomama_v2/pages/pagestart/StartPage.dart';
import 'package:gomama_v2/states/CurrentUser.dart';
import 'package:provider/provider.dart';

class PasswordReset extends StatefulWidget {
  @override
  _PasswordResetState createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  TextEditingController tecEmail = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Passwort Vergessen",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/Logo.png"),
                          fit: BoxFit.fitHeight),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        buildEmail(),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      padding: EdgeInsets.only(top: 3, left: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: MaterialButton(
                        child: Text(
                          "Password reset",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          buildPasswordReset(context, tecEmail.text);
                        },
                        color: Color(0xff3b93c3),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void buildPasswordReset(BuildContext context, String email) {
    CurrentUser currentUser = Provider.of<CurrentUser>(context, listen: false);
    currentUser.resetPassword(email);
    final snackBar = SnackBar(
      content: Text(
        'Eine Email wurde an die ${tecEmail.text} geschickt',
        style: TextStyle(fontSize: 20),
      ),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => StartPage(),
      ),
    );
  }

  Widget buildEmail() => TextFormField(
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.emailAddress,
        controller: tecEmail,
        validator: (value) {
          if (value.contains("@stud.fra-uas.de")) {
            return null;
          } else {
            return 'Enter a valid email';
          }
        },
        onSaved: (value) => setState(
          () => tecEmail.text = value,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.alternate_email),
          hintText: "@stud-fra.uas",
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.grey[400]),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey[400],
            ),
          ),
        ),
      );
}
