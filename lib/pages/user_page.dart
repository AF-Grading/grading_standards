import 'package:flutter/material.dart';

import '/models/user.dart';
import 'add_edit_user_page.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key, required this.user}) : super(key: key);

  final User user;

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Name: ${user.name}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Email: ${user.email}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Squadron: ${user.squad}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Rank: ${user.rank.name}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Permissions: ${user.permission.name}"),
          ),
        ],
      ),
    );
  }
}
