import 'package:app_prototype/models/grade_enums.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'user.dart';

class UserSetting {
  final String email;
  final String name;
  final String squad;
  final Rank rank;
  final AdQual adQual;
  final PilotQual pilotQual;
  final String themeMode;
  Permission permission;

  //TODO include user settings here

  UserSetting(
      {required this.name,
      required this.rank,
      required this.squad,
      String? id,
      required this.email,
      required this.adQual,
      required this.pilotQual,
      this.themeMode = "system",
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
      adQual: (data?['adQual'] as String).adQual!,
      pilotQual: (data?['pilotQual'] as String).pilotQual!,
      themeMode: data?['themeMode'],
      permission: (data?['permission'] as String).permission,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "name": name,
      "email": email,
      "squad": squad,
      "rank": rank.name,
      "adQual": adQual.name,
      "pilotQual": pilotQual.name,
      "themeMode": themeMode,
      "permission": permission.name,
    };
  }
}

//enum Rank { secondLt, firstLt, capt, maj, ltCol, colonel }

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

extension RanktoString on Rank {
  String? get pretty {
    switch (this) {
      case Rank.secondLt:
        return "Second Lieutenant";
      case Rank.firstLt:
        return "First Lieutenant";
      case Rank.capt:
        return "Captain";
      case Rank.maj:
        return "Major";
      case Rank.ltCol:
        return "Lieutenant Colonel";
      case Rank.colonel:
        return "Colonel";
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
