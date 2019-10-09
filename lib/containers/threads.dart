import 'package:flutter/material.dart';
import '../components/thread/thread.dart';

class Threads extends StatefulWidget {
  Threads({Key key}) : super(key: key);

  @override
  _ThreadsState createState() => _ThreadsState();
}

class _ThreadsState extends State<Threads> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: Column(
        children: <Widget>[
          Thread(type: 'text', text: 'Hello', date: '12:00'),
        ],
      ),
    );
  }
}
