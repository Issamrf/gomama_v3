import 'package:flutter/material.dart';
import 'package:gomama_v2/pages/pagestart/StartPage.dart';
import 'package:gomama_v2/pages/pagescreen/Menu.dart';
import 'package:gomama_v2/states/CurrentUser.dart';
import 'package:provider/provider.dart';

enum AuthStatus { notLoggedIn, loggedIn }

class ServiceRoot extends StatefulWidget {
  @override
  _ServiceRootState createState() => _ServiceRootState();
}

class _ServiceRootState extends State<ServiceRoot> {
  AuthStatus authStatus = AuthStatus.notLoggedIn;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    CurrentUser currentUser = Provider.of<CurrentUser>(context, listen: false);
    String returnString = await currentUser.onStartUp();
    if (returnString == "success") {
      setState(() {
        authStatus = AuthStatus.notLoggedIn;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget retVal;
    switch (authStatus) {
      case AuthStatus.notLoggedIn:
        retVal = StartPage();
        break;
      case AuthStatus.loggedIn:
        retVal = Menu();
        break;
      default:
    }
    return retVal;
  }
}
