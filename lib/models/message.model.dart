import 'package:guester/models/user.model.dart';

enum MessageType {
  text,
  file
}

class Message {
  final User sender;
  final String text;
  final MessageType type;
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

List<Message> messages = [
  Message(
    sender: currentUser,
    text: "Hello",
    type: MessageType.text,
    date: "2019-20-12 13:23:22"
  ),
  Message(
    sender: currentUser,
    text: "How are you?",
    type: MessageType.text,
    date: "2019-20-12 13:23:60"
  ),
  Message(
    sender: james,
    text: "Hi! I\'m definitely well.",
    type: MessageType.text,
    date: "2019-20-12 13:30:10"
  ),
];