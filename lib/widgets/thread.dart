import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guester/models/message.model.dart';

class Thread extends StatelessWidget {
  final Message message;
  final bool isMe;

  Thread({ this.message, this.isMe });

  _buildThreadLeft() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Image here
        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
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
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    color: Colors.blue,
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
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text(
                    '11:57',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 12
                    )
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
          padding: EdgeInsets.only(bottom: 5),
          child: Text(message.date,
            style: TextStyle(color: Colors.black87, fontSize: 12)
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
          constraints: BoxConstraints(maxWidth: 170),
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Text(
            message.text,
            style: TextStyle(color: Colors.white)
          )
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    if (isMe) {
      _buildThreadRight();
    }

    return _buildThreadLeft();
  }
}