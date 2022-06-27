import 'user.dart';

// fake backend
class Users {
  final List<User> _users = [
    User(name: "Captain Underpants", email: 'cu@gmail.com', password: '123456'),
    User(name: "2nd Lieutenant Dan", email: '2ld@gmail.com', password: '54321' ),
    User(name: "2nd Lieutenant Kinger", email: '2lk@gmail.com', password: '12345'),
  ];

  User get user => _users.first;
  List<User> get users => _users;
}
