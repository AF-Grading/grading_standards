import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user.dart';
import 'users.dart';

class CurrentUser extends ChangeNotifier {

  late final User _currentUser;

  set setUser(User value) {
    _currentUser = value;
    notifyListeners();
  }

  User get user => _currentUser;

  Permission get permission => _currentUser.permission;

  // we might not need this logout thing, since we can just pheonix the whole thing

  // logout () {
  //   _currentUser = User(
  //     name: "",
  //     rank: Rank.secondLt,
  //     squad: "",
  //     id: "",
  //     email: "",
  //     password: "",
  //     permission: Permission.student,
  //   );
  //   notifyListeners();
  // }
}
