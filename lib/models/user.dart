import 'package:flutter/cupertino.dart';

import 'grade_enums.dart';

class User {
  final String email;
  final String password; // TODO delete, handled by auth
  final String id; //= UniqueKey().toString(); TODO delete in favor of email
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
      String? password,
      Permission? permission})
      : id = id ?? UniqueKey().toString(),
        permission = permission ?? Permission.student,
        password = password ?? "changeme";
}

// User Permission.length

extension PermissionToString on Permission {
  String get pretty {
    switch (this) {
      case Permission.student:
        return "Student";
      case Permission.instructor:
        return "Instructor";
      case Permission.training_shop:
        return "Training Shop";
      case Permission.wing_training:
        return "Wing Training";
    }
  }
}



//wing_training have rights to everything and can grant perssions to other users

//trainig shop have rights to add/edit/remove user accounts in their squadron and can grant perssions to other users for training shop rights

//instructor cannot delete or edit user accounts in their squadron, but can edit studnets they have graded, they can also view other
//grade sheet in their squadron but cannot change them

//students can only view their own gradesheets

// TODO make a currentUser class that is a singleton with ChangeNotifier
// put in own file
// class CurrentUser extends ChangeNotifier {
