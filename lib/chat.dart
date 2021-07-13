import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:gomama_v2/services/Database.dart';
import 'package:gomama_v2/setting.dart';
import 'package:flutter/material.dart';
import 'package:gomama_v2/states/CurrentUser.dart';

import 'ChatConvo.dart';

class ChatPageRoom extends StatefulWidget {
  @override
  _ChatPageRoomState createState() => _ChatPageRoomState();
}

class _ChatPageRoomState extends State<ChatPageRoom> {
  Stream chatRooms;
  Database db = new Database();
  //TexrEditingController searchText = new TexrEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ListViews',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            bottomOpacity: 0.0,
            elevation: 0,
            automaticallyImplyLeading: false,
            //leading: Icon(Icons.arrow_back_ios, color: Colors.black),
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
            title: Text(
              'Chats',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Colors.black),
            )),
        body: BodyLayout(),
      ),
    );
    //
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

Widget _myListView(BuildContext context) {
  return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("Users").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Text("Loading data...");

        return ListView(padding: EdgeInsets.all(10), children: <Widget>[
//UserSuch Funktion - - - - - - -  - - -  - - - - -
          Container(
              padding: EdgeInsets.all(5),
              height: 50,
              width: 200,
              child: TextField(
                  textAlignVertical: TextAlignVertical.bottom,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      hintText: 'Suche',
                      hintStyle: TextStyle(fontSize: 16)))),

          //Abstand von Chats
          Container(
            height: 20,
            width: 20,
          ),

// Expandet eine Row mit meheren Sachen- - - -  - - - - - - -  - - - -  - - - -
          Expanded(
              child: Row(children: [
            GestureDetector(
              child: Row(
                children: [
                  // Bild von User, default Bild zurzeit, da kein bild gespiechert wird in der db
                  Container(
                      height: 50,
                      width: 50,
                      child: CircleAvatar(
                        //child: new Image.asset('res/defaultpb.png'),
                        backgroundImage: ExactAssetImage('assets/unnamed.png'),
                      )),
                  Container(height: 50, width: 10),

                  Text(snapshot.data.docs[0]['fullName'],
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17))
                ],
              ),
              onTap: () {
                print("Click event on container ");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatConvo()),
                );
              },
            )
          ])),
        ]);
      });
}

/*

//Checkt log in

if (formKey.currentState.validate()) {
          loginUser(tecEmail.text, tecPass.text, context);
        }



class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ListViews',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            bottomOpacity: 0.0,
            elevation: 0,
            automaticallyImplyLeading: false,
            //leading: Icon(Icons.arrow_back_ios, color: Colors.black),
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
            title: Text(
              'Chats',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Colors.black),
            )),
        body: BodyLayout(),
      ),
    );
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

// replace this function with the code in the examples
Widget _myListView(BuildContext context) {
  return ListView(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    children: <Widget>[
      Container(
          //SearchSuche
          padding: EdgeInsets.all(10),
          height: 50,
          width: 200,
          child: TextField(
              textAlignVertical: TextAlignVertical.bottom,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  hintText: 'Suche',
                  hintStyle: TextStyle(fontSize: 16)))),
      Container(
        height: 20,
        width: 10,
      ),
      GestureDetector(
        onTap: () {
          print("Click event on container ");
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondRoute()),
          );
        },
        child: Row(
          //Erste Row
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 50,
              width: 50,
              child: CircleAvatar(
                //child: new Image.asset('res/defaultpb.png'),
                backgroundImage: ExactAssetImage('assets/defaultpp.png'),
              ),
            ),
            Container(
              height: 50,
              width: 10,
            ),
            Container(
                height: 50,
                width: 300,
                //color: Colors.grey[200],
                // Letzte Nachricht fetchen
                child: Column(
                  children: [
                    Container(height: 7),
                    Row(
                      children: [
                        //Name von User
                        Text("Lisa Müller",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17)),
                      ],
                    ),
                    Row(
                      // Letzte nachricht vo User
                      children: [
                        Text("Hi, lange nicht mehr geschrieben",
                            style: TextStyle(fontSize: 15)),
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
      //erste Row ende oben-----
      Container(
        height: 20,
      ),
      Row(
        children: [
          Container(
            height: 50,
            width: 50,
            child: CircleAvatar(
              //child: new Image.asset('res/defaultpb.png'),
              backgroundImage: ExactAssetImage('assets/defaultpp.png'),
            ),
          ),
          Container(
            height: 50,
            width: 10,
          ),
          Container(
              height: 50,
              width: 300,
              //color: Colors.grey[200],
              // Letzte Nachricht fetchen
              child: Column(
                children: [
                  Container(height: 7),
                  Row(
                    children: [
                      //Name von User
                      Text("Klara Klein",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17)),
                    ],
                  ),
                  Row(
                    // Letzte nachricht vo User
                    children: [
                      Text("Hast du die Bafög Formulare noch?",
                          style: TextStyle(fontSize: 15)),
                    ],
                  )
                ],
              ))
        ],
      ),
      Container(
        height: 20,
      ),
      // Zweite Reihe
      Row(
        children: [
          Container(
            height: 50,
            width: 50,
            child: CircleAvatar(
              //child: new Image.asset('res/defaultpb.png'),
              backgroundImage: ExactAssetImage('assets/defaultpp.png'),
            ),
          ),
          Container(
            height: 50,
            width: 10,
          ),
          Container(
              height: 50,
              width: 300,
              //color: Colors.grey[200],
              // Letzte Nachricht fetchen
              child: Column(
                children: [
                  Container(height: 7),
                  Row(
                    children: [
                      //Name von User
                      Text("Mikasa Acker",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17)),
                    ],
                  ),
                  Row(
                    // Letzte nachricht vo User
                    children: [
                      Text("Für 30 euro pro Stunde???",
                          style: TextStyle(fontSize: 15)),
                    ],
                  )
                ],
              ))
        ],
      ),
      Container(
        height: 20,
      ),
      Row(
        children: [
          Container(
            height: 50,
            width: 50,
            child: CircleAvatar(
              //child: new Image.asset('res/defaultpb.png'),
              backgroundImage: ExactAssetImage('assets/defaultpp.png'),
            ),
          ),
          Container(
            height: 50,
            width: 10,
          ),
          Container(
              height: 50,
              width: 300,
              //color: Colors.grey[200],
              // Letzte Nachricht fetchen
              child: Column(
                children: [
                  Container(height: 7),
                  Row(
                    children: [
                      //Name von User
                      Text("Claudia Rön",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17)),
                    ],
                  ),
                  Row(
                    // Letzte nachricht vo User
                    children: [
                      Text("HalliHallo", style: TextStyle(fontSize: 15)),
                    ],
                  )
                ],
              ))
        ],
      ),
      Container(
        height: 20,
      ),
      Row(
        children: [
          Container(
            height: 50,
            width: 50,
            child: CircleAvatar(
              //child: new Image.asset('res/defaultpb.png'),
              backgroundImage: ExactAssetImage('assets/defaultpp.png'),
            ),
          ),
          Container(
            height: 50,
            width: 10,
          ),
          Container(
              height: 50,
              width: 300,
              //color: Colors.grey[200],
              // Letzte Nachricht fetchen
              child: Column(
                children: [
                  Container(height: 7),
                  Row(
                    children: [
                      //Name von User
                      Text("Tanja Kalberg",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17)),
                    ],
                  ),
                  Row(
                    // Letzte nachricht vo User
                    children: [
                      Text("Ich blocke Sie jetzt",
                          style: TextStyle(fontSize: 15)),
                    ],
                  )
                ],
              ))
        ],
      )
    ],
  );
}
*/
