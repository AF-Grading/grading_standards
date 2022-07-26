import 'package:app_prototype/models/grade_enums.dart';
import 'package:app_prototype/models/user.dart';
import 'package:app_prototype/models/user_setting.dart';
import 'package:flutter/material.dart';

import 'add_edit_user_page.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key, required this.user}) : super(key: key);

  final UserSetting user;
  final double spaceBetween = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("User"),
            GestureDetector(
              child: const Icon(
                Icons.edit,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddEditUserPage(
                      user: user,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(width: spaceBetween, child: Text("Name: ")),
                  Text("${user.name}"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(width: spaceBetween, child: Text("Email: ")),
                  Text("${user.email}"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(width: spaceBetween, child: Text("Squadron: ")),
                  Text("${user.squad}"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(width: spaceBetween, child: Text("Rank: ")),
                  Text("${user.rank.pretty}"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                      width: spaceBetween,
                      child: Text("Pilot Qualification: ")),
                  Text("${user.pilotQual.pretty}"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                      width: spaceBetween,
                      child: Text("Airdrop Qualification: ")),
                  Text("${user.adQual.pretty}"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(width: spaceBetween, child: Text("Permissions: ")),
                  Text("${user.permission.pretty}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
