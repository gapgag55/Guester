import 'package:flutter/material.dart';
import 'package:guester/containers/threads.dart';
import 'package:guester/containers/submit.dart';

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
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[Threads(), Submit()],
          ),
        ));
  }
}
