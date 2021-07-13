import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gomama_v2/pages/pagestart/StartPage.dart';

import 'package:gomama_v2/states/CurrentUser.dart';

import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:gomama_v2/setting.dart';

import 'package:table_calendar/table_calendar.dart';

import '../../editProfile.dart';

///This Class shows the Profile and of the current User
///Author: Issam Rafiq
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    CalendarFormat format = CalendarFormat.month;

    CurrentUser me = Provider.of<CurrentUser>(context) as CurrentUser;
    var about = me.currentUser.about;

    Future<void> refresh() async {
      me;

      setState(() {});
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
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
          onPressed: () async {
            CurrentUser currentUser =
                Provider.of<CurrentUser>(context, listen: false);
            String returnString = await currentUser.signOut();
            if (returnString == "success") {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => StartPage(),
                ),
                (route) => false,
              );
            }
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
      body: RefreshIndicator(
        onRefresh: () => refresh(),
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(30),
            physics: BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditProfile()));
                },
              ),
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
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                    onFormatChanged: (CalendarFormat format) {
                      setState(
                        () {
                          format = format;
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AgeKids extends StatelessWidget {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');

  @override
  Widget build(BuildContext context) {
    CurrentUser me = Provider.of<CurrentUser>(context) as CurrentUser;
    final String kidsNumber = me.currentUser.kids;
    String age = me.currentUser.birth;
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
      ],
    );
  }
}

class ProfileWidget extends StatelessWidget {
  final String imageDirection;
  final VoidCallback onPressed;
  final bool ifEdit;

  const ProfileWidget({
    key,
    this.imageDirection,
    this.onPressed,
    this.ifEdit = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CurrentUser me = Provider.of<CurrentUser>(context) as CurrentUser;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                buildImage(),
                Positioned(
                  bottom: -2,
                  right: -2,
                  child: buildEditIcon(Color(0xff3b93c3)),
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(
              child: Text(
                me.currentUser.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            Center(
              child: Text(
                me.currentUser.city,
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildImage() {
    final image = AssetImage("assets/unnamed.png");

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 110,
          height: 110,
          child: InkWell(splashColor: Color(0xff3b93c3), onTap: onPressed),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 6,
          child: Icon(
            ifEdit ? Icons.add_a_photo : Icons.edit,
            color: Colors.white,
            size: 20,
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
