import 'package:flutter/material.dart';
import 'package:guester/containers/channel/threads.dart';
import 'package:guester/containers/channel/submit.dart';

class ChannelPage extends StatefulWidget {
  ChannelPage({Key key}) : super(key: key);

  final String title = "Practical Software Engineering";

  @override
  _ChannelPageState createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title, style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Threads(
                channel: 'practical-software-engineering',
              ),
              Submit()
            ],
          ),
        ));
  }
}
