import 'package:flutter/material.dart';

class TextMessageRight extends StatelessWidget {
  TextMessageRight({Key key, this.text, this.date}) : super(key: key);

  final String text;
  final String date;

  @override
  Widget build(BuildContext context) {
    BoxDecoration decorator = new BoxDecoration(
      borderRadius: new BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20)),
      color: Colors.blue,
    );

    EdgeInsets padding =
        EdgeInsets.only(top: 10, right: 20, bottom: 10, left: 20);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(bottom: 5),
            child: Text(date,
                style: TextStyle(color: Colors.black87, fontSize: 12))),
        Container(
            decoration: decorator,
            padding: padding,
            constraints: BoxConstraints(maxWidth: 170),
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Text(text, style: TextStyle(color: Colors.white))),
      ],
    );
  }
}
