import 'package:app_prototype/models/CurrentUser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/my_grade_sheets_page.dart';
import '../pages/reference_materials_page.dart';
import '../pages/settings_page.dart';
import '../pages/users_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            context.watch<CurrentUser>().user.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        // only display this tab if the user is instructor or greater
        if (context.watch<CurrentUser>().permission.index > 0)
          ListTile(
            title: const Text('My Grade Sheets'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyGradeSheetsPage()),
              );
            },
          ),
        ListTile(
          title: const Text('Reference Materials'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ReferenceMaterialsPages()),
            );
          },
        ),
        if (context.watch<CurrentUser>().permission.index > 2)
          ListTile(
            title: const Text('Users'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UsersPage()),
              );
            },
          ),
        ListTile(
          title: const Text('Settings'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
            );
          },
        ),
      ]),
    );
  }
}
