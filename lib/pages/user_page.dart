import 'package:app_prototype/models/grade_enums.dart';
//import 'package:app_prototype/models/user.dart';
import 'package:app_prototype/models/user_setting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/User.dart';
import '../models/aws_state.dart';
import 'add_edit_user_page.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  String _squad = "";

  @override
  void initState() {
    getSquad();
    super.initState();
  }

  getSquad() async {
    final squad =
        await context.read<AWSState>().getSquad(widget.user.squadronID);
    setState(() {
      _squad = squad;
    });
  }

  //final UserSetting user;
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
                      user: widget.user,
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
                  Text("${widget.user.name}"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(width: spaceBetween, child: Text("Email: ")),
                  Text("${widget.user.email}"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(width: spaceBetween, child: Text("Squadron: ")),
                  Text("${_squad}"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(width: spaceBetween, child: Text("Rank: ")),
                  Text("${widget.user.rank}"),
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
                  Text("${widget.user.pilotQual}"),
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
                  Text("${widget.user.adQual}"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(width: spaceBetween, child: Text("Permissions: ")),
                  Text("${widget.user.permission!}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
