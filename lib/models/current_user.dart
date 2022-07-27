import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:app_prototype/models/User.dart';
import 'package:app_prototype/models/grade_enums.dart';
import 'package:flutter/material.dart';
//import 'user.dart';
import 'user_setting.dart';

class CurrentUser extends ChangeNotifier {
  CurrentUser() {
    Amplify.Hub.listen([HubChannel.Auth], (hubEvent) async {
      switch (hubEvent.eventName) {
        case 'SIGNED_IN':
          final AuthUser authUser = await Amplify.Auth.getCurrentUser();
          await Amplify.DataStore.observeQuery(User.classType)
              .listen((QuerySnapshot<User> snapshot) {
            _user = snapshot.items
                .firstWhere((user) => user.email == authUser.username);
          });
          notifyListeners();
          print('USER IS SIGNED IN');
          break;
        case 'SIGNED_OUT':
          print('USER IS SIGNED OUT');
          break;
        case 'SESSION_EXPIRED':
          print('SESSION HAS EXPIRED');
          break;
        case 'USER_DELETED':
          print('USER HAS BEEN DELETED');
          break;
      }
    });
  }

  User? _user;
  //Stream<User> _stream;

  /*set stream(Stream<User> stream) {
    _stream = stream;
    notifyListeners();
  }*/

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
