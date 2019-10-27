import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guester/models/message.model.dart';
import 'package:guester/models/user.model.dart';
import 'package:guester/widgets/FileSender.dart';
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

  _buildMessages() {
    var stream = FirebaseDatabase.instance.reference()
      .child("channels")
      .child("practical-software-engineer")
      .orderByChild("timestamp")
      .limitToLast(10)
      .onValue;
  
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CupertinoActivityIndicator();
        }

        Map<dynamic, dynamic> map = snapshot.data.snapshot.value;
        List<Message> messages = [];

        map.forEach((index, value) {
          User user = User(
            id: value["userid"],
            firstname: value["firstname"],
            lastname: value["lastname"],
            avatar: value["avatar"]
          );

          String date = DateFormat('kk:mm')
            .format(DateTime.fromMillisecondsSinceEpoch(value["timestamp"]))
            .toString();

          Message message = Message(
            content: value["content"],
            date: date,
            type: value["type"],
            love: value["love"],
            sender: user,
          );

          messages.add(message);
        });

        messages.sort((a, b) => a.date.compareTo(b.date));

        return ListView.builder(
          padding: EdgeInsets.all(20),
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final Message message = messages[index];
            final bool isMe = message.sender.id == currentUser.id;
            return Thread(message: message, isMe: isMe);
          },
        );
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
              child: _buildMessages(),
            ),
            Sender(),
            FileSender()
          ],
        ),
      )
    );
  }
}
