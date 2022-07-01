import 'package:flutter/cupertino.dart';

class User {
  final String email;
  final String password;
  final String id; //= UniqueKey().toString();
  final String name;
  final String squad;
  final Rank rank;
  Permission permission;

  //TODO include user settings here

  User(
      {required this.name,
      required this.rank,
      required this.squad,
      String? id,
      required this.email,
      required this.password,
      Permission? permission})
      : id = id ?? UniqueKey().toString(),
        permission = permission ?? Permission.student;
}

enum Rank { secondLt, firstLt, capt, maj, ltCol, colonel }

// User Permission.length
enum Permission { student, instructor, training_shop, wing_training,}

//wing_training have rights to everything and can grant perssions to other users

//trainig shop have rights to add/edit/remove user accounts in their squadron and can grant perssions to other users for training shop rights

//instructor cannot delete or edit user accounts in their squadron, but can edit studnets they have graded, they can also view other
//grade sheet in their squadron but cannot change them

//students can only view their own gradesheets

// TODO make a currentUser class that is a singleton with ChangeNotifier
// put in own file
// class CurrentUser extends ChangeNotifier {