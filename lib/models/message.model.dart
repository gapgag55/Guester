import 'package:guester/models/user.model.dart';

class Message {
  final User sender;
  final String text;
  final String type;
  final String date;

  Message({this.sender, this.text, this.type, this.date});
}

// Current User
final User currentUser = User(
    id: "0",
    firstname: "Sarayut",
    lastname: "Lawilai",
    avatar: "assets/images/avatar.jpg");

// Users
final User james = User(
    id: "1",
    firstname: "Prakit",
    lastname: "Manee",
    avatar: "assets/images/avatar.jpg");
