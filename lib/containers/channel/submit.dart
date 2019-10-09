import 'package:flutter/material.dart';

class Submit extends StatefulWidget {
  Submit({Key key}) : super(key: key);

  @override
  _SubmitState createState() => _SubmitState();
}

class _SubmitState extends State<Submit> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
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
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Type a message here'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(
                    Icons.send,
                    color: Colors.black54,
                    size: 24.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                ),
              ],
            ),
          ),
        ),
        // Container(
        //   height: 120,
        //   decoration: BoxDecoration(
        //       color: Colors.white,
        //       borderRadius: BorderRadius.all(Radius.circular(30))),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: <Widget>[
        //       Container(
        //           padding: EdgeInsets.all(15),
        //           margin: EdgeInsets.only(left: 10, right: 10),
        //           decoration: BoxDecoration(
        //             border: Border.all(
        //                 width: 1,
        //                 color: Colors
        //                     .black12 //                   <--- border width here
        //                 ),
        //           ),
        //           child: Icon(
        //             Icons.insert_drive_file,
        //             color: Colors.black,
        //           )),
        //       Container(
        //           padding: EdgeInsets.all(15),
        //           margin: EdgeInsets.only(left: 10, right: 10),
        //           decoration: BoxDecoration(
        //             border: Border.all(
        //                 width: 1,
        //                 color: Colors
        //                     .black12 //                   <--- border width here
        //                 ),
        //           ),
        //           child: Icon(
        //             Icons.filter,
        //             color: Colors.black,
        //           )),
        //       Container(
        //           padding: EdgeInsets.all(15),
        //           margin: EdgeInsets.only(left: 10, right: 10),
        //           decoration: BoxDecoration(
        //             border: Border.all(
        //                 width: 1,
        //                 color: Colors
        //                     .black12 //                   <--- border width here
        //                 ),
        //           ),
        //           child: Icon(
        //             Icons.camera_alt,
        //             color: Colors.black,
        //           )),
        //       Container(
        //           padding: EdgeInsets.all(15),
        //           margin: EdgeInsets.only(left: 10, right: 10),
        //           decoration: BoxDecoration(
        //             border: Border.all(
        //                 width: 1,
        //                 color: Colors
        //                     .black12 //                   <--- border width here
        //                 ),
        //           ),
        //           child: Icon(
        //             Icons.mic_none,
        //             color: Colors.black,
        //           )),
        //     ],
        //   ),
        // )
      ],
    );
  }
}
