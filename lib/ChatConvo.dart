import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gomama_v2/models/OurUser.dart';

import 'dart:async';

import 'states/Utils.dart';

///here is Where the user can write chat and send it to the database
///Author: Suada Fejzovic

TextEditingController textFieldController = TextEditingController();
bool isWriting = false;

class ChatConvo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var con = context;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Container(
                  width: 50,
                  height: 50,
                  child: CircleAvatar(
                    //child: new Image.asset('res/defaultpb.png'),
                    backgroundImage: ExactAssetImage("assets/unnamed.png"),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Sam Morello",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Online",
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            children: [
              // Text("data")
              //here will
              // Text(sender.messageContent)
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                //Benutzereingabe
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: TextField(
                      controller: textFieldController,
                      decoration: InputDecoration(
                          hintText: "Schreibe eine Nachricht...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                      onChanged: (val) {
                        (val.length > 0 && val.trim() != "")
                            ? setWriting(true)
                            : setWriting(false);
                        //H
                      },
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      if (textFieldController.text != "") {
                        sendMessage();

                        senderLayout();
                      }
                    },
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                    backgroundColor: Colors.blueGrey,
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
          //messageList();//Listview von messsages
        ],
      ),
    );
  }
}

void sendMessage() async {
  //Message aufnehmen
  var messageContent = textFieldController.text;

  print(messageContent);
  textFieldController.clear();

  //in datenbank speichern
  //
  //message printen

  //message in datenbank speichern
}

setWriting(bool trueorfalse) {
  isWriting = trueorfalse;
}

Widget messageList() {
  return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: 6,
      itemBuilder: (context, index) {
        return chatMessageItem();
      });
}

Widget chatMessageItem() {
  return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Container(
        child: senderLayout(), // 2 Layout für sender und reciver
      ));
}

Widget senderLayout() {
  Radius messRad = Radius.circular(10);
  return Container(
    constraints: BoxConstraints(
        //Context
        maxWidth: 200,
        maxHeight: 10
        //maxWidth: MediaQuery.of(context).size.width *0.65
        ),
    decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.only(
          topLeft: messRad,
          topRight: messRad,
          bottomLeft: messRad,
        )),
    child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          "Hello",
          style: TextStyle(color: Colors.black, fontSize: 14),
        )),
  );
}

Widget receiverLayout() {
  Radius messRad = Radius.circular(10);
  return Container(
    constraints: BoxConstraints(
        //Context
        // maxWidth: MediaQuery.of(context).size.width *0.65
        ),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomRight: messRad,
          topRight: messRad,
          bottomLeft: messRad,
        )),
    child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          "Hello",
          style: TextStyle(color: Colors.black, fontSize: 14),
        )),
  );
}

class FirebaseApi {
  static Stream<List<OurUser>> getUsers() => FirebaseFirestore.instance
      .collection('P2UpSjIqwKb0DUfA2p5J6QdEHC62_0kNgyx7Z5GhuuSnc89tqqGGNoDL2')
      .orderBy("lastMessage.read", descending: true)
      .snapshots()
      .transform(Utils.transformer(OurUser.fromJson));

  static Future uploadMessage(String userID, String message) async {
    final mess = FirebaseFirestore.instance.collection('Messages');
    print("SUCCESSFUL");

    ///First Chat Try

    /*
await mess.add(newMessage.toJson());


    final refUsers = FirebaseFirestore.instance.collection('users');
    await refUsers
        .doc("Message")
        .update({lastMessage.lastMessageTime: DateTime.now()});
       
  }


  static Stream<List<Message>> getMessages(String idUser) =>
      FirebaseFirestore.instance
          .collection('chats/$idUser/messages')
          .orderBy(MessageField.createdAt, descending: true)
          .snapshots()
          .transform(Utils.transformer(Message.fromJson));

  static Future addRandomUsers(List<OurUser> users) async {
    final refUsers = FirebaseFirestore.instance.collection('Users');

  }  */
  }

/*
class ChatConvo extends StatefulWidget {
  @override 
  _ChatConvoState createState() => _ChatConvoState();

}

class _ChatConvoState extends State<ChatConvo>{


   


  @override
  Widget build(BuildContext context) {
var uID = Provider.of<CurrentUser>(context, listen: false).getCurrentUser.uid;
var convoID = getConversationID(uID, "0kNgyx7Z5GhuuSnc89tqqGGNoDL2");  
     FirebaseFirestore.instance
         .collection('Messages')
         .doc(convoID).snapshots();

     var message = snapshot.data.docs[0]['lastMessage'];   
    

    return Scaffold(
      

    ); 
  }
}

String getConversationID(String userID, String peerID) {
    return userID.hashCode <= peerID.hashCode 
      ? userID + '_' + peerID 
      : peerID + '_' + userID;
 } 

 */
  ///Second Chat try

/*import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

Future<void> main() async {
  const api= "evdbn5wqrjah";
  const Token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiMGtOZ3l4N1o1R2h1dVNuYzg5dHFxR0dOb0RMMiJ9.RQ4tP_T2cwlsPEDUUfZblTPcWKUEd7akdF5qFbDLX3o";

  final client = StreamChatClient(
    api
    logLevel: Level.INFO,
  );

  await client.connectUser(
    User(
      id: "0kNgyx7Z5GhuuSnc89tqqGGNoDL2",
    ),
    Token,
  );

 final channel = client.channel(
    'messaging',
    id: 'Sam Morello'
    extraData: {
      "name": "Sam Morello",
    },
  );

  channel.watch();

  runApp(MyApp(client, channel));
}

class MyApp extends StatelessWidget {
 
  final StreamChatClient client;

 
  final Channel channel;

 
  MyApp(this.client, this.channel);

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData.dark().copyWith(
      accentColor: Color(0x3b93c3),
    );
    return MaterialApp(
      builder: (context, widget) {
        return StreamChat(
          child: widget,
          client: client,
          streamChatThemeData: StreamChatThemeData.fromTheme(theme),
        );
      },
      home: StreamChannel(
        channel: channel,
        child: ChannelP(),
      ),
    );
  }
}

/// Displays the list of messages inside the channel
class ChannelP extends StatelessWidget {
  const ChannelP({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChannelHeader(
        showBackButton: false,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: MessageListView(),
          ),
          MessageInput(),
        ],
      ),
    );
  }
}*/
  String getConversationID(String userID, String peerID) {
    return userID.hashCode <= peerID.hashCode
        ? userID + '_' + peerID
        : peerID + '_' + userID;
  }
}
