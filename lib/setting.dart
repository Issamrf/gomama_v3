import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Einstellungen",
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
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.moon_stars,
                size: 30,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: Center(
          child: Text('SettingsPage'),
        ));
  }
}
