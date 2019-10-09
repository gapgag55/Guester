import 'package:flutter/material.dart';
import 'package:guester/components/channel/thread/thread.dart';

class Threads extends StatefulWidget {
  Threads({Key key}) : super(key: key);

  @override
  _ThreadsState createState() => _ThreadsState();
}

class _ThreadsState extends State<Threads> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Thread(type: 'text', text: 'Hello', date: '12:00'),
        ],
      ),
    );
  }
}
