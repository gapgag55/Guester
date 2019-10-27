import 'package:guester/models/user.model.dart';

class Message {
  final User sender;
  final String content;
  final String type;
  final String date;
  final int love;

  Message({this.sender, this.content, this.type, this.date, this.love});
}

// Current User
final User currentUser = User(
  id: "UgOVkyBKBUbodalg6RjKKijtlis2",
  firstname: "Sarayut",
  lastname: "Lawilai",
  avatar: "https://firebasestorage.googleapis.com/v0/b/guester-f3953.appspot.com/o/avatars%2FUgOVkyBKBUbodalg6RjKKijtlis2.jpg?alt=media&token=96cc6b7e-7edf-411a-9190-30e0d8a443ae"
);