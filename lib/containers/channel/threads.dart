import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guester/components/channel/thread/thread.dart';

class Threads extends StatefulWidget {
  Threads({Key key, this.channel}) : super(key: key);

  final String channel;

  @override
  _ThreadsState createState() => _ThreadsState();
}

class _ThreadsState extends State<Threads> {
  StreamSubscription<Event> databaseReference;
  List<Thread> threads = [];
  bool loading = true;
  final myUserId = 'UgOVkyBKBUbodalg6RjKKijtlis1';

  ScrollController _scrollController =
      new ScrollController(initialScrollOffset: 0);

  @override
  void initState() {
    super.initState();

    FirebaseDatabase.instance.setPersistenceEnabled(true);

    databaseReference = FirebaseDatabase.instance
        .reference()
        .child("channels")
        .child(widget.channel)
        .onChildAdded
        .listen((event) async {
      var data = event.snapshot.value;

      Thread thread;

      if (threads.length > 0 && data['userid'] != myUserId) {
        if (threads.last.userID == data['userid']) {
          thread = Thread(
              userID: data['userid'],
              text: data['text'],
              type: data['type'],
              date: data['datetime'],
              direction: 'left');
        } else {
          var document = await Firestore.instance
              .collection('users')
              .document(data['userid'])
              .get();
          var fullname = await document.data["name"];
          thread = Thread(
              userID: data['userid'],
              text: data['text'],
              type: data['type'],
              date: data['datetime'],
              avatar: 'assets/images/avatar.jpg',
              fullname: fullname,
              direction: 'left');
        }
      } else {
        thread = Thread(
            userID: data['userid'],
            text: data['text'],
            type: data['type'],
            date: data['datetime'],
            direction: 'right');
      }

      setState(() {
        threads.add(thread);
      });

      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent + 40,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 300),
        );
      }
    });

    new Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  void dispose() {
    databaseReference.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    threads.sort((a, b) {
      return a.date.compareTo(b.date);
    });

    if (loading) {
      return Expanded(
          child: Container(
              child: Center(
                  child: CupertinoActivityIndicator(
        radius: 10,
      ))));
    }

    return Expanded(
        child: Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: new ListView(
        controller: _scrollController,
        padding: EdgeInsets.only(top: 20, bottom: 20),
        children: <Widget>[for (var thread in threads) thread],
      ),
    ));
  }
}
