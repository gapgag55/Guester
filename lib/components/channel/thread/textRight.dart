import 'package:flutter/material.dart';

class TextMessageRight extends StatelessWidget {
  TextMessageRight({Key key, this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    BoxDecoration decorator = new BoxDecoration(
      borderRadius: new BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20)),
      color: Colors.black12,
    );

    EdgeInsets padding =
        EdgeInsets.only(top: 10, right: 20, bottom: 10, left: 20);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(bottom: 5),
            child: Text('11:57',
                style: TextStyle(color: Colors.black87, fontSize: 12))),
        Container(
            decoration: decorator,
            padding: padding,
            margin: EdgeInsets.only(left: 20, right: 10),
            child: Text(text, style: TextStyle(color: Colors.black))),
      ],
    );
  }
}
