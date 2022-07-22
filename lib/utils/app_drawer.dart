import 'package:app_prototype/models/current_user.dart';
import 'package:app_prototype/models/theme_change.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/User.dart';
import '../pages/all_grade_sheets_page.dart';
import '../pages/my_grade_sheets_page.dart';
import '../pages/reference_materials_page.dart';
import '../pages/settings_page.dart';
import '../pages/users_page.dart';
import '../theme/dark_mode.dart';
import '../theme/light_mode.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        DrawerHeader(
          decoration: BoxDecoration(
            // not really sure why this isn't changing
            // color: context.watch<ThemeChange>().mode == ThemeMode.dark
            //     ? primaryDarkBlue
            //     : primaryBlue,

            // TODO why is this not working?

            color: Theme.of(context).colorScheme.primary,
          ),
          child: context.watch<CurrentUser>().user != null
              ? Text(
                  context.watch<CurrentUser>().user!.email,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                )
              : Container(),
        ),
        // only display this tab if the user is instructor or greater
        //if (context.watch<CurrentUser>().permission.index > 0)
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
        //if (context.watch<CurrentUser>().permission.index > 2)
        ListTile(
          title: const Text('All Grade Sheets'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AllGradeSheetsPage()),
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
        //if (context.watch<CurrentUser>().permission.index > 2)
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
