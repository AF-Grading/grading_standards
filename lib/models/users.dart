import 'package:flutter/foundation.dart';

import 'user.dart';

// fake backend
class Users with ChangeNotifier {
  final List<User> _users = [
    User(
        name: "Captain Underpants",
        rank: Rank.capt,
        squad: "4th Airlift",
        id: "1"),
    User(
        name: "1st Lieutenant Dan",
        rank: Rank.firstLt,
        squad: "4th Airlift",
        id: "2"),
    User(
        name: "2nd Lieutenant Kinger",
        rank: Rank.secondLt,
        squad: "4th Airlift",
        id: "3"),
    User(
        name: "Airman Schmuckatelli",
        rank: Rank.secondLt,
        squad: "7th Airlift",
        id: "4")
  ];

  User get user => _users.first;
  List<User> get users => _users;

  User userByName(String name) =>
      _users.firstWhere((user) => user.name == name);
}
