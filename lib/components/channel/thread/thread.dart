import 'package:flutter/widgets.dart';
import 'package:guester/components/channel/thread/textLeft.dart';
import 'package:guester/components/channel/thread/textRight.dart';

class Thread extends StatelessWidget {
  Thread({
    Key key,
    this.type,
    this.text,
    this.date,
  }) : super(key: key);

  final String type;
  final String text;
  final String date;

  @override
  Widget build(BuildContext context) {
    Widget thread;

    switch (this.type) {
      case 'text':
        thread = TextMessageLeft(text: text);
        break;
      default:
        thread = TextMessageLeft(
          text: text,
        );
        break;
    }

    return Container(margin: EdgeInsets.only(bottom: 10), child: thread);
  }
}
