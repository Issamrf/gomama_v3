import 'package:flutter/material.dart';
import 'package:gomama_v2/pages/pagescreen/Verification.dart';
import 'package:gomama_v2/states/CurrentUser.dart';

import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../termConditions.dart';

///This Class Contains the UI and the conditions of signin Up
///Author: Issam Rafiq
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String formName = "";
  String formPlz = "";
  String formBirthday = "";
  String formKids = "";
  String formEmail = "";
  String formCity = "";
  String formPassword = "";
  String formPasswordConfirm = "";
  String days1 = "";
  String month1 = "";
  String year1 = "";
  String finalDate = '';
  int d, m, y;
  bool agree = false;
  bool validate = false;
  DateTime dateTime;
  bool isCheck = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Registrieren",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        elevation: 0,
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
        padding: EdgeInsets.symmetric(horizontal: 40),
        height: MediaQuery.of(context).size.height - 50,
        width: double.infinity,
        child: Form(
          key: formKey,
          //autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      buildName(),
                      SizedBox(
                        height: 10,
                      ),
                      buildPLZ(),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          buildDateBirthday(),
                          SizedBox(width: 20),
                          Text(
                            'Alter:',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                              color: Colors.grey[400],
                            ),
                          ),
                          SizedBox(width: 20),
                          Text(
                            year1,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                              color: Color(0xff3b93c3),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      buildKids(),
                      SizedBox(
                        height: 10,
                      ),
                      buildCity(),
                      SizedBox(
                        height: 10,
                      ),
                      buildEmail(),
                      SizedBox(
                        height: 10,
                      ),
                      buildPassword(),
                      SizedBox(
                        height: 10,
                      ),
                      buildPasswordConfirm(),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 3, left: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: buildSubmit()),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Material(
                        child: Checkbox(
                          value: isCheck,
                          onChanged: (value) {
                            setState(
                              () {
                                isCheck = value;
                              },
                            );
                          },
                        ),
                      ),
                      FlatButton(
                          child: Text('Ich akzeptiere die Nutzungsbedingungen',
                              style: TextStyle(fontSize: 12.0)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TermConditions()));
                          }),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signUpUser(String email, String password, BuildContext context,
      String plz, String kids, String name, String city) async {
    CurrentUser currentUser = Provider.of<CurrentUser>(context, listen: false);

    try {
      String returnString = await currentUser.signUpUser(
          email, password, plz, year1, kids, name, city);

      /* User firebaseUser = FirebaseAuth.instance.currentUser;
      await firebaseUser.sendEmailVerification();*/

      if (returnString == "success") {
        /*Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => PageVerifyScreen()),
            (Route<dynamic> route) => false);*/

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Verification(),
          ),
        );
      } else {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              returnString,
              style: TextStyle(fontSize: 20),
            ),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Widget buildSubmit() => MaterialButton(
        minWidth: double.infinity,
        height: 60,
        onPressed: () async {
          if (formKey.currentState.validate() && isCheck) {
            if (formPassword == formPasswordConfirm) {
              signUpUser(
                formEmail,
                formPassword,
                context,
                formPlz,
                formKids,
                formName,
                formCity,
              );
              formKey.currentState.save();
              final message = 'Email: $formEmail';
              final snackBar = SnackBar(
                content: Text(
                  message,
                  style: TextStyle(fontSize: 20),
                ),
                backgroundColor: Colors.green,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Passwords do not match",
                    style: TextStyle(fontSize: 20),
                  ),
                  backgroundColor: Colors.red,
                  duration: Duration(seconds: 2),
                ),
              );
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Akzeptieren Sie die Nutzungsbedingungen",
                  style: TextStyle(fontSize: 20),
                ),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 2),
              ),
            );
          }
        },
        color: Color(0xff3b93c3),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          "Registrieren",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      );

  Widget buildName() => TextFormField(
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.text,
        validator: (value) {
          return value.isEmpty ? 'Enter valid Name' : null;
        },
        onChanged: (value) => setState(
          () => formName = value,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person_outline),
          hintText: "Name",
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

  Widget buildPLZ() => TextFormField(
        //  autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.number,
        validator: (value) {
          return value.length < 6
              ? null
              : "Enter Postcode City with 5 characters";
        },
        onChanged: (value) => setState(
          () => formPlz = value,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.map_outlined),
          hintText: "PLZ",
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

  Widget buildDateBirthday() => RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: Color(0xff3b93c3),
        child: Icon(Icons.calendar_today_sharp),
        onPressed: () {
          calculator();
        },
      );

  Widget buildKids() => TextFormField(
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.number,
        validator: (value) {
          return value.length >= 0
              ? null
              : "Enter valid Number 0 or greater than ";
        },
        onChanged: (value) => setState(
          () => formKids = value,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.child_care),
          hintText: "Kinder",
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

  Widget buildCity() => TextFormField(
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.text,
        validator: (value) {
          return value.isEmpty ? "Enter City name" : null;
        },
        onChanged: (value) => setState(
          () => formCity = value,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.location_city),
          hintText: "Stadt",
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.grey[400],
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey[400],
            ),
          ),
        ),
      );

  Widget buildEmail() => TextFormField(
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value.contains("@stud.fra-uas.de")) {
            return null;
          } else {
            return 'Enter a valid email';
          }
        },
        onChanged: (value) => setState(
          () => formEmail = value,
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

  Widget buildPassword() => TextFormField(
        //  autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.text,
        validator: (value) {
          return value.length < 6 ? "Enter a password 6+ chars long" : null;
        },
        onChanged: (value) => setState(
          () => formPassword = value,
        ),
        obscureText: true,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock_outline),
          hintText: "Passwort",
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.grey[400],
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey[400],
            ),
          ),
        ),
      );

  Widget buildPasswordConfirm() => TextFormField(
        //  autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.text,
        validator: (value) {
          return value.length < 6 ? "Enter a password 6+ chars long" : null;
        },
        onChanged: (value) => setState(
          () => formPasswordConfirm = value,
        ),
        obscureText: true,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock_open),
          hintText: "Passwort wiederholen",
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.grey[400],
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey[400],
            ),
          ),
        ),
      );

  Future calculator() async {
    DateTime date1 = await showDatePicker(
      locale: Locale('de'),
      fieldLabelText: "Geburtstagdatum",
      fieldHintText: 'Tag-Monat-Jahr',
      context: context,
      initialDate: dateTime == null ? DateTime.now() : dateTime,
      firstDate: DateTime(1900),
      lastDate: DateTime(2030),
    );
    setState(
      () {
        d = int.parse(DateFormat("dd").format(date1));
        m = int.parse(DateFormat("MM").format(date1));
        y = int.parse(DateFormat("yyyy").format(date1));
        int d1 = int.parse(DateFormat("dd").format(DateTime.now()));
        int m1 = int.parse(DateFormat("MM").format(DateTime.now()));
        int y1 = int.parse(DateFormat("yyyy").format(DateTime.now()));
        int day = findDays(m1, y1);

        if (d1 - d >= 0)
          days1 = (d1 - d).toString() + "days";
        else {
          days1 = (d1 + day - d).toString() + "days";
          m1 = m1 - 1;
        }
        if (m1 - m >= 0)
          month1 = (m1 - m).toString() + "months";
        else {
          month1 = (m1 + 12 - m).toString() + "months";
          y1 = y1 - 1;
        }
        year1 = (y1 - y).toString(); /*"years"*/
      },
    );
  }

  int findDays(int m2, int y2) {
    int day2;
    if (m2 == 1 ||
        m2 == 3 ||
        m2 == 5 ||
        m2 == 7 ||
        m2 == 8 ||
        m2 == 10 ||
        m2 == 12)
      day2 = 31;
    else if (m2 == 4 || m2 == 6 || m2 == 9 || m2 == 11)
      day2 = 30;
    else {
      if (y2 % 4 == 0)
        day2 = 29;
      else
        day2 = 28;
    }
    return day2;
  }
}
