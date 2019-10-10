import 'package:flutter/material.dart';

class TextMessageLeft extends StatelessWidget {
  TextMessageLeft(
      {Key key, this.text, this.date, this.avatar, this.fullname = ''})
      : super(key: key);

  final String text;
  final String avatar;
  final String fullname;
  final String date;

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

    if (this.avatar == '') {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Image here
          SizedBox(
            width: 60,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                      decoration: decorator,
                      padding: padding,
                      constraints: BoxConstraints(maxWidth: 170),
                      margin: EdgeInsets.only(right: 10),
                      child: Text(text, style: TextStyle(color: Colors.black))),
                  Container(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(date,
                          style:
                              TextStyle(color: Colors.black87, fontSize: 12)))
                ],
              )
            ],
          )
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Image here
        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: CircleAvatar(
            backgroundImage: ExactAssetImage(avatar),
            radius: 20,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Text(fullname,
                  style: TextStyle(
                      fontWeight: FontWeight.w600, letterSpacing: 0.5)),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                    decoration: decorator,
                    padding: padding,
                    constraints: BoxConstraints(maxWidth: 170),
                    margin: EdgeInsets.only(right: 10),
                    child: Text(text, style: TextStyle(color: Colors.black))),
                Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text('11:57',
                        style: TextStyle(color: Colors.black87, fontSize: 12)))
              ],
            )
          ],
        )
      ],
    );
  }
}
