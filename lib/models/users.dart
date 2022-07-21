import 'package:app_prototype/models/user_setting.dart';
import 'package:flutter/foundation.dart';

import 'grade_enums.dart';
import 'user.dart';

// fake backend
class Users with ChangeNotifier {
  final List<User> _users = [
    User(
        name: "Captain Underpants",
        rank: Rank.capt,
        squad: "4th Airlift Squadron",
        id: "1",
        email: 'cu@spaceforce.mil',
        password: 'password',
        permission: Permission.wing_training),
    User(
        name: "1st Lieutenant Dan",
        rank: Rank.firstLt,
        squad: "4th Airlift Squadron",
        id: "2",
        email: 'dandandan@spaceforce.mil',
        password: 'password',
        permission: Permission.instructor),
    User(
        name: "2nd Lieutenant Kinger",
        rank: Rank.secondLt,
        squad: "4th Airlift Squadron",
        id: "3",
        email: '2lk@gmail.com',
        password: '123456',
        permission: Permission.training_shop),
    User(
      name: "Airman Schmuckatelli",
      rank: Rank.secondLt,
      squad: "7th Airlift Squadron",
      id: "4",
      email: "as@gmail.com",
      password: '123456',
    ),
    User(
      name: "Airman Scruffy",
      rank: Rank.secondLt,
      squad: "7th Airlift Squadron",
      id: "5",
      email: "scruff@gmail.com",
      password: '123456',
    ),
  ];

  User get user => _users.first;
  List<User> get users => _users;

  User userByName(String name) =>
      _users.firstWhere((user) => user.name == name);

  String updateById(User gradeSheet) {
    int index = _users.indexWhere((sheet) => sheet.id == gradeSheet.id);
    index == -1
        ? _users.add(gradeSheet)
        : _users.replaceRange(index, index + 1, [gradeSheet]);
    notifyListeners();
    return gradeSheet.id;
  }
}
