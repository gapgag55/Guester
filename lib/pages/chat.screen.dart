import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'package:guester/models/message.model.dart';
import 'package:guester/widgets/FileSender.dart';
import 'package:guester/widgets/thread.dart';
import 'package:guester/widgets/sender.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key key}) : super(key: key);

  final String title = "Practical Software Engineering";

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // final _message = TextEditingController();
  // bool _activeFileSender = false;

  // _getMessages() {
  //   // Listen Message From Firebase

  //   // Set Message to messages state
  // }

  // _sendMessage() {
  //   // Get text

  //   // Send message to Firebase
  // }

  // _openFileSender() {
  //   // Set state to open file sender
  //   setState(() {
  //     _activeFileSender = true;
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    developer.log(messages[0].text, name: 'chat.screen.dart');

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(color: Colors.black)),
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
              child: ListView.builder(
                padding: EdgeInsets.all(20),
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) {
                  final Message message = messages[index];
                  final bool isMe = message.sender.id == currentUser.id;
                  return Thread(message: message, isMe: isMe);
                },
              ),
            ),
            Sender(),
            FileSender()
          ],
        ),
      )
    );
  }
}
