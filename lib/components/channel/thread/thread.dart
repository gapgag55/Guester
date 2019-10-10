import 'package:flutter/widgets.dart';
import 'package:guester/components/channel/thread/textLeft.dart';
import 'package:guester/components/channel/thread/textRight.dart';
import 'package:intl/intl.dart';

class Thread extends StatelessWidget {
  Thread({
    Key key,
    this.type,
    this.text,
    this.date,
    this.direction,
    this.userID,
    this.avatar = '',
    this.fullname = '',
  }) : super(key: key);

  final String type;
  final String text;
  final String date;
  final String userID;
  final String avatar;
  final String fullname;
  final String direction;

  @override
  Widget build(BuildContext context) {
    Widget thread;

    String datetime = DateFormat('kk:mm').format(DateTime.parse(date));

    if (this.direction == 'left') {
      thread = TextMessageLeft(
        text: text,
        date: datetime,
        avatar: this.avatar.length > 0 ? this.avatar : '',
        fullname: this.fullname.length > 0 ? this.fullname : '',
      );
    } else {
      thread = TextMessageRight(
        text: text,
      );
    }

    return Container(margin: EdgeInsets.only(bottom: 10), child: thread);
  }
}
