import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gomama_v2/pages/pagestart/StartPage.dart';
import 'package:gomama_v2/services/Database.dart';

import 'package:gomama_v2/setting.dart';
import 'package:gomama_v2/states/CurrentUser.dart';
import 'package:provider/provider.dart';

import 'OtherUserProfile.dart';
import 'Profile.dart';

///with this Class we can search existing User on the database
///Author: Issam Rafiq & Suada
class Search extends StatefulWidget {
  @override
  _SearchUser createState() => _SearchUser();
}

class _SearchUser extends State<Search> {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  TextEditingController searchController = new TextEditingController();
  Database database = new Database();

  QuerySnapshot searchItemSnapshot;
  bool haveUserSearched = false;

  startSearch() async {
    await database
        .getUser(
      searchController.text,
    )
        .then((snapshot) {
      searchItemSnapshot = snapshot;

      print("$searchItemSnapshot");

      setState(() {
        haveUserSearched = true;
      });
    });
    return searchItemSnapshot;
  }

  static int ind;
  Widget list() {
    return haveUserSearched
        ? ListView.builder(
            itemCount: searchItemSnapshot.docs.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              ind = index;
              return searchList(
                searchItemSnapshot.docs[ind]["fullName"],
                searchItemSnapshot.docs[ind]["birthday"],
                searchItemSnapshot.docs[ind]["city"],
              );
            })
        : Container();
  }

  Widget searchList(String name, String age, String city) {
    return Container(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              buildImage(),
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                'Alter',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                age,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Stadt',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                city,
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildMessageIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircles(
          color: color,
          all: 6,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.message,
              size: 30,
              color: Colors.white,
            ),
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

  Widget buildImage() {
    final image = AssetImage("assets/unnamed.png");
    int index;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => OtherProfile()));
      },
      child: ClipOval(
        child: Material(
          color: Colors.transparent,
          child: Ink.image(
            image: image,
            fit: BoxFit.cover,
            width: 80,
            height: 80,
            child: InkWell(splashColor: Color(0xff3b93c3)),
          ),
        ),
      ),
    );
  }

  Widget buildCircles({
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: searchController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: "User Suchen",
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
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
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      startSearch();
                    },
                    icon: Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            list(),
          ],
        )),
      ),
    );
  }
}
