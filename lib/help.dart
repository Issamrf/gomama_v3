import 'package:flutter/material.dart';
import 'package:gomama_v2/setting.dart';

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
          child: Text('HelpPage'),
        ));
  }
}
