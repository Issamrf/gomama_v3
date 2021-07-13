import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:gomama_v2/states/CurrentUser.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:gomama_v2/setting.dart';

import 'package:table_calendar/table_calendar.dart';

import '../../ChatConvo.dart';

///This Class shows the Profile and of the current User
///Author: Issam Rafiq

class OtherProfile extends StatelessWidget {
  var name = "Sam Morello";
  var age = "25";
  var city = "Frankurt";
  var about = "Hi";
  var kids = "9";

  @override
  Widget build(BuildContext context) {
    CalendarFormat format = CalendarFormat.month;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profil",
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
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(30),
          physics: BouncingScrollPhysics(),
          children: [
            ProfileWidget(),
            Divider(
              thickness: 1.5,
              color: Color(0xff3b93c3),
            ),
            const SizedBox(height: 10),
            AgeKids(),
            const SizedBox(height: 60),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Über mich.',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Center(
                      child: Text(
                    about,
                    style: TextStyle(fontSize: 16, height: 1.4),
                  )),
                ],
              ),
            ),
            const SizedBox(height: 60),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Kalender',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                TableCalendar(
                  focusedDay: DateTime.now(),
                  firstDay: DateTime(2000),
                  lastDay: DateTime(2070),
                  calendarFormat: format,
                  onFormatChanged: (CalendarFormat format) {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget aboutBuilder(BuildContext context) {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  var uID = Provider.of<CurrentUser>(context, listen: false).getCurrentUser.uid;

  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Über mich.',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        FutureBuilder<DocumentSnapshot>(
          future: users.doc(uID).get(),
          /*Fehler*/
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data.data() as Map<String, dynamic>;
              print(snapshot.data.data() as Map<String, dynamic>);
              return Center(
                  child: Text(
                "${data['about']}",
                style: TextStyle(fontSize: 16, height: 1.4),
              ));
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ],
    ),
  );
}

class AgeKids extends StatelessWidget {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  var kidsNumber = "8";
  var age = "25";
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(
              'Kinder',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Center(
              child: Text(
                kidsNumber,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            )
          ],
        ),
        Column(
          children: <Widget>[
            Text(
              'Alter',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Center(
              child: Text(
                age,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ],
        ),
        buildEditIcon(context, Color(0xff3b93c3)),
      ],
    );
  }

  Widget buildEditIcon(context, Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 1,
          child: IconButton(
            icon: Icon(
              Icons.mail_outline,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChatConvo()));
            },
          ),
        ),
      );
  Widget buildCircle({
    Widget child,
    double all,
    Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}

class ProfileWidget extends StatelessWidget {
  var name = "Sam Morello";
  var age = "25";
  var city = "Frankurt";

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                buildImage(),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(
              child: Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            Center(
              child: Text(
                city,
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 6,
          child: Icon(
            Icons.message_sharp,
            color: Colors.white,
            size: 25,
          ),
        ),
      );

  Widget buildImage() {
    final image = AssetImage("assets/unnamed.png");

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 90,
          height: 90,
          child: InkWell(splashColor: Color(0xff3b93c3)),
        ),
      ),
    );
  }

  Widget buildCircle({
    Widget child,
    double all,
    Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
