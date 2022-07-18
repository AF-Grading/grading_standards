import 'package:app_prototype/models/grade_enums.dart';
import 'package:app_prototype/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user_setting.dart';

class UserNameTextBox extends StatelessWidget {
  const UserNameTextBox(
      {Key? key, required this.email, this.extras, this.style})
      : super(key: key);

  final String email;
  final String? extras;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Consumer<List<UserSetting>>(builder: ((context, stream, child) {
      UserSetting user = stream.firstWhere((user) => user.email == email,
          orElse: () => UserSetting(
                email: "",
                name: "No User",
                rank: Rank.capt,
                squad: "yo",
                adQual: AdQual.acad,
                pilotQual: PilotQual.fpc,
              ));
      return user.email == ""
          ? Text(
              "${this.extras} ${this.email}",
              style: this.style,
            )
          : Text(
              "${this.extras} ${user.rank.pretty} ${user.name}",
              style: this.style,
            );
    }));
  }
}
