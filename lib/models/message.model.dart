import 'package:guester/models/user.model.dart';

class Message {
  final User sender;
  final String text;
  final String type;
  final String date;
  final bool isLoved;

  Message({this.sender, this.text, this.type, this.date, this.isLoved});
}

// Current User
final User currentUser = User(
    id: "UgOVkyBKBUbodalg6RjKKijtlis1",
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
    type: "text",
    date: "2019-20-12 13:23:22",
    isLoved: false,
  ),
  Message(
    sender: currentUser,
    text: "How are you?",
    type: "text",
    date: "2019-20-12 13:23:60",
    isLoved: false,
  ),
  Message(
    sender: james,
    text: "Hi! I\'m definitely well.",
    type: "text",
    date: "2019-20-12 13:30:10",
    isLoved: false,
  ),
  Message(
    sender: currentUser,
    text: "Hello",
    type: "text",
    date: "2019-20-12 13:23:22",
    isLoved: false,
  ),
];