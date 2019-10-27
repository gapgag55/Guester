
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:guester/models/message.model.dart';

class Sender extends StatelessWidget {
  TextEditingController inputController = TextEditingController();

  // 'imageUrl': imageUrl,
  // 'senderName': googleSignIn.currentUser.displayName,
  // 'senderPhotoUrl': googleSignIn.currentUser.photoUrl,

  Future _sendMessage() async {
    if (inputController.text.isNotEmpty) {
      var thread = FirebaseDatabase.instance.reference()
        .child("channels")
        .child("practical-software-engineer")
        .push();
        
      thread.set({
        "content": inputController.text,
        "type": "text",
        "timestamp": DateTime.now().millisecondsSinceEpoch,
        "love": 0,
        "userid": currentUser.id,
        "firstname": currentUser.firstname,
        "lastname": currentUser.lastname,
        "avatar": currentUser.avatar
      });

      inputController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Container(
        padding: EdgeInsets.only(top: 10, right: 20, bottom: 10, left: 20),
        margin: EdgeInsets.only(bottom: 20),
        decoration: new BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 15.0, // has the effect of softening the shadow
                spreadRadius: 1.0, // has the effect of extending the shadow
                offset: Offset(
                  0, // horizontal, move right 10
                  10, // vertical, move down 10
                ),
              )
            ],
            borderRadius: BorderRadius.all(Radius.circular(40))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () => {},
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 20),
                child: Icon(
                  Icons.attachment,
                  color: Colors.black54,
                  size: 24.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
              ),
            ),
            new Flexible(
              child: TextField(
                controller: inputController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Type a message here'),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 20),
                child: GestureDetector(
                  onTap: () { _sendMessage(); },
                  child: Icon(
                    Icons.send,
                    color: Colors.black54,
                    size: 24.0,
                    semanticLabel:
                        'Text to announce in accessibility modes',
                  ),
                )),
          ],
        ),
      ),
    );
  }
}