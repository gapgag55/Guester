import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FileSender extends StatelessWidget {
  



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 120,
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40)
        ),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 50, right: 50),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12)
              ),
              padding: EdgeInsets.all(20),
              child: Icon(Icons.picture_as_pdf),
            )
          ),
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12)
              ),
              padding: EdgeInsets.all(20),
              child: Icon(Icons.photo),
            )
          ),
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12)
              ),
              padding: EdgeInsets.all(20),
              child: Icon(Icons.photo_camera),
            )
          ),
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12)
              ),
              padding: EdgeInsets.all(20),
              child: Icon(Icons.record_voice_over),
            )
          ),
        ],
      ),
    );
  }
}