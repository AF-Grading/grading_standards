import 'package:app_prototype/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user_setting.dart';

class UserNameTextBox extends StatelessWidget {
  const UserNameTextBox({Key? key, required this.email}) : super(key: key);

  final String email;

  @override
  Widget build(BuildContext context) {
    return Consumer<List<UserSetting>>(builder: ((context, stream, child) {
      // TODO better error handle
      UserSetting user = stream.firstWhere((user) => user.email == email,
          orElse: () => UserSetting(
              email: "", name: "No User", rank: Rank.capt, squad: "yo"));
      return Text("${user.rank.pretty} ${user.name}");
    }));
  }
}
