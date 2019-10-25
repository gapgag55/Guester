import 'package:flutter/material.dart';
import 'package:guester/models/message.model.dart';
import 'package:guester/widgets/thread.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key key}) : super(key: key);

  final String title = "Practical Software Engineering";

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  _getMessages() {
    // Listen Message From Firebase

    // Set Message to messages state
  }

  _sendMessage() {
    // Get text

    // Send message to Firebase
  }

  _buildMessage(Message message, bool isMe) {
    // return Thread(message: message, isMe: isMe);
    return Text(message.text);
  }

  _buildSender() {
    return Text("Hello");
  }

  _buidFileSender() {}

  @override
  Widget build(BuildContext context) {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListView.builder(
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                final Message message = messages[index];
                final bool isMe = message.sender.id == currentUser.id;
                return _buildMessage(message, isMe);
              },
            ),
            _buildSender()
          ],
        ),
      ),
    );
  }
}
