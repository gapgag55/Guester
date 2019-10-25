import 'package:flutter/material.dart';
import 'package:guester/pages/chat.screen.dart';
import 'package:guester/pages/home.screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/chat',
      routes: {
        '/': (context) => HomeScreen(),
        '/chat': (context) => ChatScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
