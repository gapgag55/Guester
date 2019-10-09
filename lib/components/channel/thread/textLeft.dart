import 'package:flutter/material.dart';

class TextMessageLeft extends StatelessWidget {
  TextMessageLeft({Key key, this.text, this.avatar}) : super(key: key);

  final String text;
  final String avatar;

  @override
  Widget build(BuildContext context) {
    BoxDecoration decorator = new BoxDecoration(
        borderRadius: new BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20)),
        color: Colors.black12);

    EdgeInsets padding =
        EdgeInsets.only(top: 10, right: 20, bottom: 10, left: 20);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        // Image here
        Container(
            decoration: decorator,
            padding: padding,
            margin: EdgeInsets.only(left: 20, right: 10),
            child: Text(text, style: TextStyle(color: Colors.black))),
        Container(
            padding: EdgeInsets.only(bottom: 5),
            child: Text('11:57',
                style: TextStyle(color: Colors.black87, fontSize: 12)))
      ],
    );
  }
}
