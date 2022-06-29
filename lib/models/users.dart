import 'package:flutter/foundation.dart';

import 'user.dart';

// fake backend
class Users with ChangeNotifier {
  final List<User> _users = [
    User(
        name: 'test',
        rank: Rank.capt,
        squad: "test",
        id: "100000",
        email: 'test',
        password: 'test'),
    User(
        name: "Captain Underpants",
        rank: Rank.capt,
        squad: "4th Airlift",
        id: "1",
        email: 'cu@gmail.com',
        password: '123456'),
    User(
        name: "1st Lieutenant Dan",
        rank: Rank.firstLt,
        squad: "4th Airlift",
        id: "2",
        email: '2ld@gmail.com',
        password: '54321'),
    User(
      name: "2nd Lieutenant Kinger",
      rank: Rank.secondLt,
      squad: "4th Airlift",
      id: "3",
      email: '2lk@gmail.com',
      password: '123456',
    ),
    User(
      name: "Airman Schmuckatelli",
      rank: Rank.secondLt,
      squad: "7th Airlift",
      id: "4",
      email: "as@gmail.com",
      password: '123456',
    )
  ];

  User get user => _users.first;
  List<User> get users => _users;

  User userByName(String name) =>
      _users.firstWhere((user) => user.name == name);
}
