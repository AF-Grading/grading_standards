import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/application_state.dart';
import '../models/user.dart';
import '../models/user_setting.dart';
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
        body: Consumer<List<UserSetting>>(
          builder: (context, userStream, child) {
            return Column(
              children: userStream
                  .map(
                    (user) => ListTile(
                      title: Text("${user.rank.pretty} ${user.name}"),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserPage(
                                user: User(
                                    name: user.name,
                                    rank: user.rank,
                                    email: user.email,
                                    permission: user.permission,
                                    squad: user.squad))),
                      ),
                    ),
                  )
                  .toList(),
            );
          },
          //),
        ));
  }
}
