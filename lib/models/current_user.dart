import 'package:app_prototype/models/User.dart';
import 'package:app_prototype/models/grade_enums.dart';
import 'package:flutter/material.dart';
//import 'user.dart';
import 'user_setting.dart';

class CurrentUser extends ChangeNotifier {
  CurrentUser();

  User? _user;

  //late final User _currentUser;
  //late final UserSetting _userSetting;

  set setUser(User value) {
    _user = value;
    notifyListeners();
  }

  ThemeMode get theme => _user!.themeMode!.themeMode!;

  //set userSetting(UserSetting value) {
  // _userSetting = value;
  // notifyListeners();
  //}

  // UserSetting get user => _userSetting;

  User? get user => _user;

  //String get email => _userSetting.email;

  Permission get permission => Permission.wing_training;
  //    _userSetting.permission; //_currentUser.permission;

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

extension ThemeModeFromString on String {
  ThemeMode? get themeMode {
    switch (this) {
      case "dark":
        return ThemeMode.dark;
      case "light":
        return ThemeMode.light;
      case "system":
        return ThemeMode.system;
    }
    return null;
  }
}
