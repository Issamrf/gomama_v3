import 'package:flutter/material.dart';
import 'package:gomama_v2/pages/pagescreen/Menu.dart';
import 'package:gomama_v2/pages/pagescreen/PasswordReset.dart';
import 'package:gomama_v2/states/CurrentUser.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController tecEmail =
      TextEditingController(text: "rafiq@stud.fra-uas.de");
  TextEditingController tecPass = TextEditingController(text: "12345678");

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool checkCurrentPasswordValid = true;

  @override
  Widget build(BuildContext context) {
    CurrentUser currentUser = Provider.of<CurrentUser>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35,
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
      body: SafeArea(
        child: Container(
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
                          buildPassword(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => PasswordReset(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Passwort Vergessen",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          )
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
                        child: buildLogin(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loginUser(String email, String password, BuildContext context) async {
    CurrentUser currentUser = Provider.of<CurrentUser>(context, listen: false);
    try {
      String returnString =
          await currentUser.loginUSerWithEmail(email, password);
      if (returnString == "success") {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Menu(),
          ),
        );
        //formKey.currentState.save();
        final snackBar = SnackBar(
          content: Text(
            '${tecEmail.text}',
            style: TextStyle(fontSize: 20),
          ),
          backgroundColor: Colors.green,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "Zugangsdaten sind falsch",
              style: TextStyle(fontSize: 20),
            ),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Widget buildLogin() {
    return MaterialButton(
      child: Text(
        "Login",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      minWidth: double.infinity,
      height: 60,
      onPressed: () async {
        if (formKey.currentState.validate()) {
          loginUser(tecEmail.text, tecPass.text, context);
        }
      },
      color: Color(0xff3b93c3),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
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

  Widget buildPassword() => TextFormField(
        //autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.text,
        controller: tecPass,
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
}

/*
if (formKey.currentState.validate()) {
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
final message = 'Name: $formName\nEmail: $formEmail';
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
}*/
