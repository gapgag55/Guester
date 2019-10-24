import 'package:flutter/material.dart';
import 'package:guester/pages/chat.screen.dart';
import 'package:guester/pages/home.screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/channel',
      routes: {
        '/': (context) => HomeScreen(),
        '/chat': (context) => ChatScreen(),
        // '/channel': (context) => ChannelPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
