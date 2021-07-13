import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gomama_v2/chat.dart';
import 'package:gomama_v2/help.dart';
import 'package:gomama_v2/pages/pagebottomnavigation/OtherUserProfile.dart';
import 'package:gomama_v2/pages/pagebottomnavigation/SearchUser.dart';
import 'package:gomama_v2/pages/pagebottomnavigation/Profile.dart';

///This Class ist to navigate to the other pages in the app.
///Author: Suada
class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int pressedIndex = 0;

  final List<Widget> screenOptions = [
    Search(),
    Profile(),
    ChatPageRoom(),
    HelpPage(),
  ];

  void onPress(int index) {
    setState(() {
      pressedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: screenOptions[pressedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xff3b93c3),
          iconSize: 30,
          selectedItemColor: Colors.black38,
          unselectedItemColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.location_fill),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_fill),
              title: Text(''),
            ),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.chat_bubble_2_fill),
                title: Text(''),
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
              icon: Icon(Icons.help),
              title: Text(''),
            ),
          ],
          currentIndex: pressedIndex,
          onTap: onPress,
        ));
  }
}
