import 'package:flutter/material.dart';
import 'package:gomama_v2/financeChoice.dart';
import 'package:gomama_v2/financeHelp.dart';
import 'package:gomama_v2/setting.dart';

/// Here is the main Help Page
/// Author: Mahida ahmed
class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Hilfe",
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
            Icons.logout,
            size: 30,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()));
            },
            icon: Icon(
              Icons.settings,
              size: 30,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RaisedButton(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 120),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FinanceChoice(12);
              }));
            },
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                side: BorderSide(color: Colors.blue)),
            child: Text("Kinderbetreeung",
                style: TextStyle(color: Colors.blue, fontSize: 17)),
          ),
          SizedBox(
            height: 16,
          ),
          RaisedButton(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 120),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FinanceChoice(13);
              }));
            },
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                side: BorderSide(color: Colors.blue)),
            child: Text("Urlaubsemester",
                style: TextStyle(color: Colors.blue, fontSize: 17)),
          ),
          SizedBox(
            height: 16,
          ),
          RaisedButton(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 130),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FinanceChoice(14);
              }));
            },
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                side: BorderSide(color: Colors.blue)),
            child: Text("Familienbüro",
                style: TextStyle(color: Colors.blue, fontSize: 17)),
          ),
          SizedBox(
            height: 16,
          ),
          RaisedButton(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 130),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FinanceHelp()));
            },
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                side: BorderSide(color: Colors.blue)),
            child: Text("Finanzierung",
                style: TextStyle(color: Colors.blue, fontSize: 17)),
          ),
        ],
      )),
    );
  }
}
