
import 'package:flutter/widgets.dart';

class Sender extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 30),
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
                controller: text,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Type a message here'),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 20),
                child: GestureDetector(
                  onTap: () => createRecord(),
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