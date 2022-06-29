import 'package:flutter/cupertino.dart';

class User {
  String email;
  String password;
  final String id; //= UniqueKey().toString();
  final String name;
  final String squad;
  final Rank rank;
  //TODO include user settings here

  User(
      {required this.name, required this.rank, required this.squad, String? id, required this.email, required this.password})
      : id = id ?? UniqueKey().toString();
}

enum Rank { secondLt, firstLt, capt, maj, ltCol, colonel }

// TODO make a currentUser class that is a singleton with ChangeNotifier
// put in own file
// class CurrentUser extends ChangeNotifier {