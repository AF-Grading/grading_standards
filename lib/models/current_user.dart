/* import 'package:app_prototype/models/application_state.dart';
import 'package:flutter/material.dart';
import 'user.dart';
import 'user_setting.dart';

class CurrentUser extends ChangeNotifier {
  //late final User _currentUser;
  UserSetting? _userSetting;
  ThemeMode _mode = ThemeMode.system;

  /*set setUser(User value) {
    _currentUser = value;
    notifyListeners();
  }*/

  set userSetting(UserSetting value) {
    _userSetting = value;
    _mode = value.themeMode.mode!;
    notifyListeners();
  }

  ThemeMode get mode => _mode;

  set mode(ThemeMode mode) {
    _mode = mode;
    notifyListeners();
  }

  UserSetting get user => _userSetting!;

  //User get user => _currentUser;

  String get email => _userSetting!.email;

  Permission get permission =>
      _userSetting!.permission; //_currentUser.permission;

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

extension LightModeFromString on String {
  ThemeMode? get mode {
    switch (this) {
      case "system":
        return ThemeMode.system;
      case "dark":
        return ThemeMode.dark;
      case "light":
        return ThemeMode.light;
    }
    return null;
  }
}
 */