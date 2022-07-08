import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/users.dart';
import 'add_edit_user_page.dart';
import 'user_page.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Users"),
            GestureDetector(
              child: const Icon(
                Icons.add,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddEditUserPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: context
            .watch<Users>()
            .users
            .map((user) => ListTile(
                  title: Text(user.name),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserPage(user: user)),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
