import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'package:guester/models/message.model.dart';
import 'package:guester/models/user.model.dart';
import 'package:guester/widgets/thread.dart';
import 'package:guester/widgets/sender.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key key}) : super(key: key);

  final String channel = "Practical Software Engineering";

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> messages = [];
  StreamSubscription<Event> databaseReference;

  void initState() {
    super.initState();
    _getMessages();
  }

  _getMessages() {
    // Listen Message From Firebase
    FirebaseDatabase.instance.setPersistenceEnabled(true);

    databaseReference = FirebaseDatabase.instance
      .reference()
      .child("channels")
      .child("practical-software-engineering")
      .orderByChild("datetime")
      .onChildAdded
      .listen((event) async {
        var message = event.snapshot.value;
        
        String user = message['userid'];
        String text = message['text'];
        String type = message['type'];
        String date = DateFormat('kk:mm').format(DateTime.parse(message["datetime"]));

        Firestore.instance.collection('users').document(user).get().then((document) {
          String id = document.documentID;
          String firstname = document["firstname"];
          String lastname = document["lastname"];

          // Set Message to messages state
          setState(() {
            User user = User(
              id: id,
              firstname:
              firstname,
              lastname:
              lastname,
              avatar: "assets/images/avatar.jpg"
            );

            Message message = Message(
              text: text,
              type: type,
              date: date,
              sender: user
            );

            messages.add(message);
          });
        });
    });
  }

  // _openFileSender() {
  //   // Set state to open file sender
  //   setState(() {
  //     _activeFileSender = true;
  //   });
  // }

  _buildThread() {
    if (messages.isEmpty) {
      return CupertinoActivityIndicator();
    }

    return ListView.builder(
      padding: EdgeInsets.all(20),
      itemCount: messages.length,
      itemBuilder: (BuildContext context, int index) {
        final Message message = messages[index];
        final bool isMe = message.sender.id == currentUser.id;
        return Thread(message: message, isMe: isMe);
      },
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.channel, style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: _buildThread(),
            ),
            Sender(),
            // FileSender()
          ],
        ),
      )
    );
  }
}
