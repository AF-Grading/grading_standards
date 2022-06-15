import 'package:flutter/cupertino.dart';

class User {
  String id = UniqueKey().toString();
  String name;
  //TODO include user settings here

  User({required this.name});
}

// TODO make a currentUser class that is a singleton with ChangeNotifier
// put in own file
// class CurrentUser extends ChangeNotifier {