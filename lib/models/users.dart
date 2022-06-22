import 'user.dart';

// fake backend
class Users {
  final List<User> _users = [
    User(name: "Captain Underpants"),
    User(name: "1st Lieutenant Dan"),
    User(name: "2nd Lieutenant Kinger"),
    User(name: "Airman Schmuckatelli")
  ];

  User get user => _users.first;
  List<User> get users => _users;
}
