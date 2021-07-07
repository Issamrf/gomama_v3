import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gomama_v2/pages/pagestart/StartPage.dart';
import 'package:gomama_v2/setting.dart';
import 'package:gomama_v2/states/CurrentUser.dart';
import 'package:gomama_v2/user.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    final user = UserInfoProfile.initUser;
    CollectionReference users = FirebaseFirestore.instance.collection('Users');

    Future getUsers() async {
      var firestore = FirebaseFirestore.instance;
      QuerySnapshot users = await firestore.collection("Users").get();

      return users.docs;
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          "Suchen",
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
      body: Container(
        child: FutureBuilder(
          future: getUsers(),

          /*Fehler*/
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: Text(
                "Loading...",
                style: TextStyle(fontSize: 16, height: 1.4),
              ));
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, index) {
                    return ListTile(
                      title: Text(snapshot.data[index].data["fullName"]),
                    );
                  });
            }
          },
        ),
        /*Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    //color: Color(0xff3b93c3),
                    border: Border.all(
                      color: Color(0xff3b93c3),
                      width: 2.5,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: ProfileWidget(
                    imagePath: user.imagePath,
                    onClicked: () {},
                  ),
                ),*/
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  final user = UserInfoProfile.initUser;
  final String imagePath;
  final VoidCallback onClicked;

  const ProfileWidget({
    key,
    this.imagePath,
    this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildImage(),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  'Alter',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  user.age,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  user.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  user.city,
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget buildImage() {
    final image = AssetImage("assets/example.jpg");

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 110,
          height: 110,
          child: InkWell(splashColor: Color(0xff3b93c3), onTap: onClicked),
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
