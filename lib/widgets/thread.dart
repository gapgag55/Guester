import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'package:guester/models/message.model.dart';
import 'package:intl/intl.dart';

class Thread extends StatelessWidget {
  final Message message;
  final bool isMe;

  Thread({ this.message, this.isMe });

  _buildThreadLeft() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(right: 10),
          child: CircleAvatar(
            backgroundImage: ExactAssetImage(message.sender.avatar),
            radius: 20,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
                message.sender.firstname + " " + message.sender.lastname,
                style: TextStyle(
                fontWeight: FontWeight.w600, letterSpacing: 0.5)
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    color: Colors.black12,
                  ),
                  padding: EdgeInsets.only(top: 10, right: 20, bottom: 10, left: 20),
                  constraints: BoxConstraints(maxWidth: 170),
                  margin: EdgeInsets.only(right: 10),
                  child: Text(
                    message.text,
                    style: TextStyle(color: Colors.black)
                  )
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    DateFormat('kk:mm').format(DateTime.parse(message.date)),
                    style: TextStyle(color: Colors.black45, fontSize: 10)
                  )
                )
              ],
            )
          ],
        )
      ],
    );
  }

  _buildThreadRight() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            DateFormat('kk:mm').format(DateTime.parse(message.date)),
            style: TextStyle(color: Colors.black45, fontSize: 10)
          )
        ),
        Container(
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            color: Colors.blue,
          ),
          padding: EdgeInsets.only(top: 10, right: 20, bottom: 10, left: 20),
          margin: EdgeInsets.only(left: 10, bottom: 5),
          constraints: BoxConstraints(maxWidth: 170),
          child: Text(
            message.text,
            style: TextStyle(color: Colors.white)
          )
        ),
      ],
    );
  }

  _buildThreadFileLeft() {}

  _buildThreadFileRight() {}

  @override
  Widget build(BuildContext context) {
    developer.log('Is message of mine?: ' + isMe.toString(), name: 'thred.dart');

    if (isMe) {
      return _buildThreadRight();
    }
    
    return _buildThreadLeft();
  }
}