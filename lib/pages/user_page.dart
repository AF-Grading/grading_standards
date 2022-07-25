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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Name: ${widget.user.name}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Email: ${widget.user.email}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Squadron: ${_squad}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Rank: ${widget.user.rank}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Pilot Qual: ${widget.user.pilotQual}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Ad Qual: ${widget.user.adQual}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Permissions: ${widget.user.permission}"),
            ),
          ],
        ),
      ),
    );
  }
}
