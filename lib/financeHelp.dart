import 'package:flutter/material.dart';
import 'package:gomama_v2/financeChoice.dart';
import 'package:gomama_v2/setting.dart';

class FinanceHelp extends StatelessWidget {
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
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 110),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FinanceChoice(1);
                  }));
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    side: BorderSide(color: Colors.blue)),
                child: Text("Elterngeld",
                    style: TextStyle(color: Colors.blue, fontSize: 17)),
              ),
              SizedBox(
                height: 16,
              ),
              RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 110),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FinanceChoice(2);
                  }));
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    side: BorderSide(color: Colors.blue)),
                child: Text("Kindergeld",
                    style: TextStyle(color: Colors.blue, fontSize: 17)),
              ),
              SizedBox(
                height: 16,
              ),
              RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 92),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FinanceChoice(3);
                  }));
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    side: BorderSide(color: Colors.blue)),
                child: Text("Kinderzuschlag",
                    style: TextStyle(color: Colors.blue, fontSize: 17)),
              ),
              SizedBox(
                height: 16,
              ),
              RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 83),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FinanceChoice(4);
                  }));
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    side: BorderSide(color: Colors.blue)),
                child: Text("Mutterschaftsgeld",
                    style: TextStyle(color: Colors.blue, fontSize: 17)),
              ),
              SizedBox(
                height: 16,
              ),
              RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 115),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FinanceChoice(5);
                  }));
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    side: BorderSide(color: Colors.blue)),
                child: Text("Wohngeld",
                    style: TextStyle(color: Colors.blue, fontSize: 17)),
              ),
              SizedBox(
                height: 16,
              ),
              RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 83),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FinanceChoice(6);
                  }));
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    side: BorderSide(color: Colors.blue)),
                child: Text("Arbeitslosengeld II",
                    style: TextStyle(color: Colors.blue, fontSize: 17)),
              ),
              SizedBox(
                height: 16,
              ),
              RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 130),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FinanceChoice(7);
                  }));
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    side: BorderSide(color: Colors.blue)),
                child: Text("Bafög",
                    style: TextStyle(color: Colors.blue, fontSize: 17)),
              ),
              SizedBox(
                height: 16,
              ),
              RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 16),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FinanceChoice(8);
                  }));
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    side: BorderSide(color: Colors.blue)),
                child: Text("Unterhaltsvorschuss für Alleinerziehende",
                    style: TextStyle(color: Colors.blue, fontSize: 15)),
              ),
              SizedBox(
                height: 16,
              ),
              RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 115),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FinanceChoice(9);
                  }));
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    side: BorderSide(color: Colors.blue)),
                child: Text("Stipendien",
                    style: TextStyle(color: Colors.blue, fontSize: 17)),
              ),
              SizedBox(
                height: 16,
              ),
              RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 85),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FinanceChoice(10);
                  }));
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    side: BorderSide(color: Colors.blue)),
                child: Text("Zinsfreie Darlehen",
                    style: TextStyle(color: Colors.blue, fontSize: 17)),
              ),
              SizedBox(
                height: 16,
              ),
              RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 142),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FinanceChoice(11);
                  }));
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    side: BorderSide(color: Colors.blue)),
                child: Text("Kfw",
                    style: TextStyle(color: Colors.blue, fontSize: 17)),
              ),
            ],
          )),
        ));
  }
}
