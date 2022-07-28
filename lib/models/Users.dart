import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

import 'User.dart';

class Users extends ChangeNotifier {
  Users() {
    Amplify.DataStore.observeQuery(User.classType)
        .listen((QuerySnapshot<User> snapshot) {
      _users = snapshot.items;
      notifyListeners();
    });
  }

  List<User> _users = [];

  List<User> get users => _users;
}
