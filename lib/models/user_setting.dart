import 'package:cloud_firestore/cloud_firestore.dart';

import 'user.dart';

class UserSetting {
  final String email;
  final String name;
  final String squad;
  final Rank rank;
  Permission permission;

  //TODO include user settings here

  UserSetting(
      {required this.name,
      required this.rank,
      required this.squad,
      String? id,
      required this.email,
      String? password,
      Permission? permission})
      : permission = permission ?? Permission.student;

  factory UserSetting.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserSetting(
      name: data?['name'],
      email: data?['email'],
      squad: data?['squad'],
      rank: (data?['rank'] as String).rank!,
      permission: (data?['permission'] as String).permission,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "name": name,
      "email": email,
      "squad": squad,
      "rank": rank.name,
      "permission": permission.name,
    };
  }
}

enum Rank { secondLt, firstLt, capt, maj, ltCol, colonel }

// converts a string into an enum value
extension RankFromString on String {
  Rank? get rank {
    switch (this) {
      case "secondLt":
        return Rank.secondLt;
      case "firstLt":
        return Rank.firstLt;
      case "capt":
        return Rank.capt;
      case "maj":
        return Rank.maj;
      case "ltCol":
        return Rank.ltCol;
      case "colonel":
        return Rank.colonel;
    }
    return null;
  }
}

// User Permission.length

// converts a string into an enum value
extension PermissionFromString on String {
  Permission? get permission {
    switch (this) {
      case "student":
        return Permission.student;
      case "instructor":
        return Permission.instructor;
      case "training_shop":
        return Permission.training_shop;
      case "wing_training":
        return Permission.wing_training;
    }
    return null;
  }
}
