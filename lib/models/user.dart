import 'package:flutter/cupertino.dart';

class User {
  String id = UniqueKey().toString();
  String name;
  String email;
  String password;
  //TODO include user settings here

  User({required this.name, required this.email, required this.password});
}

// TODO make a currentUser class that is a singleton with ChangeNotifier
// put in own file
// class CurrentUser extends ChangeNotifier {