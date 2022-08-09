import 'package:app_prototype/models/current_user.dart';
import 'package:app_prototype/models/theme_change.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/application_state.dart';
import '../pages/all_grade_sheets_page.dart';
import '../pages/lists/barrel.dart';
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
          child: Text(
            context.watch<ApplicationState>().user.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        // only display this tab if the user is instructor or greater
        if (context.watch<ApplicationState>().user.permission.index > 0)
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
        if (context.watch<ApplicationState>().user.permission.index > 2)
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
        if (context.watch<ApplicationState>().user.permission.index > 0)
          ListTile(
            title: const Text('Users'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UsersPage()),
              );
            },
          ),
        if (context.watch<ApplicationState>().user.permission.index > 2)
          ListTile(
            title: const Text('Parameters'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const GradingParametersPage()),
              );
            },
          ),
        if (context.watch<ApplicationState>().user.permission.index > 2)
          ListTile(
            title: const Text('Grading Criteria'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const GradingCriteriaPage()),
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
