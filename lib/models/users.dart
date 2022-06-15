import 'user.dart';

// fake backend
class Users {
  final List<User> _users = [User(name: "Captain Underpants")];

  User get user => _users.first;
}
