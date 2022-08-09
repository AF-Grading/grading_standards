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
        body: SingleChildScrollView(
          child: Consumer<List<UserSetting>>(
            builder: (context, userStream, child) {
              return Column(
                children: userStream
                    .map(
                      (user) => ListTile(
                          title: Text("${user.rank.pretty} ${user.name}"),
                          onTap: () {
                            if (context
                                    .read<ApplicationState>()
                                    .user!
                                    .permission
                                    .index <
                                user.permission.index) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      "Cannot modify user of higher permission"),
                                ),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserPage(
                                        user: UserSetting(
                                            name: user.name,
                                            rank: user.rank,
                                            email: user.email,
                                            permission: user.permission,
                                            pilotQual: user.pilotQual,
                                            adQual: user.adQual,
                                            squad: user.squad))),
                              );
                            }
                          }),
                    )
                    .toList(),
              );
            },
            //),
          ),
        ));
  }
}
