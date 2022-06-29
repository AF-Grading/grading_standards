import 'package:flutter/cupertino.dart';

class User {
  final String id; //= UniqueKey().toString();
  final String name;
  final String squad;
  final Rank rank;
  //TODO include user settings here

  User(
      {required this.name, required this.rank, required this.squad, String? id})
      : id = id ?? UniqueKey().toString();
}

enum Rank { secondLt, firstLt, capt, maj, ltCol, colonel }

// TODO make a currentUser class that is a singleton with ChangeNotifier
// put in own file
// class CurrentUser extends ChangeNotifier {