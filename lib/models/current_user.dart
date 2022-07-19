import 'package:flutter/material.dart';
import 'user.dart';
import 'user_setting.dart';

class CurrentUser extends ChangeNotifier {
  //late final User _currentUser;
  late final UserSetting _userSetting;

  /*set setUser(User value) {
    _currentUser = value;
    notifyListeners();
  }*/

  set userSetting(UserSetting value) {
    _userSetting = value;
    notifyListeners();
  }

  UserSetting get user => _userSetting;

  //User get user => _currentUser;

  String get email => _userSetting.email;

  String? get secret => null;

  Permission get permission =>
      _userSetting.permission; //_currentUser.permission;

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
