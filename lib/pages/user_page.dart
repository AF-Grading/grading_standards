import 'package:flutter/material.dart';

import '/models/user.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: Column(
        children: [
          Text("Email: ${user.email}"),
          Text("Squadron: ${user.squad}"),
          Text("Rank: ${user.rank.name}"),
          Text("Permissions: ${user.permission.name}"),
        ],
      ),
    );
  }
}
