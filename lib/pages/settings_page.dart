import 'package:app_prototype/models/Squadrons.dart';
import 'package:app_prototype/models/current_user.dart';
import 'package:app_prototype/models/theme_change.dart';
//import 'package:app_prototype/models/user_profile.dart';
import 'package:app_prototype/widgets/theme_field.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import '../models/application_state.dart';
import '../models/user_setting.dart';
import 'add_edit_user_page.dart';

class SettingsPage extends StatelessWidget {
  final dark_mode_icon = CupertinoIcons.moon_circle;

  @override
  Widget build(BuildContext context) {
    return Consumer<List<Squadron>>(builder: (context, squads, child) {
      return Consumer<ApplicationState>(
        builder: ((context, userProvider, child) {
          UserSetting user = userProvider.user!;
          Squadron? squad = squads.isEmpty
              ? null
              : squads.firstWhere((squad) => squad.squad == user.squad);

          return Scaffold(
              appBar: AppBar(
                title: const Text("Settings"),
                elevation: 0,
                actions: [
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
                            settings: true,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${user.rank.pretty} ${user.name}",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      width: 300,
                      child: squad != null
                          ? CachedNetworkImage(
                              imageUrl: squad.image!,
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            )
                          : Container(),
                    ),
                    Text(
                      "email:    " + user.email,
                    ),
                    Text(
                      "squadron:    " + user.squad,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              context.read<ApplicationState>().signOut();
                              Phoenix.rebirth(context);
                            },
                            child: Text("Log Out")),
                      ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Wrap(
                              direction: Axis.horizontal,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                const Text("Theme:         "),
                                ThemeField(
                                  initialValue:
                                      context.watch<ApplicationState>().mode,
                                  onChanged: (value) {
                                    userProvider.mode = value;
                                    context
                                        .read<ApplicationState>()
                                        .editUserSetting(UserSetting(
                                          name: user.name,
                                          rank: user.rank,
                                          squad: user.squad,
                                          email: user.email,
                                          adQual: user.adQual,
                                          pilotQual: user.pilotQual,
                                          themeMode: value.name,
                                          permission: user.permission,
                                        ));
                                  },
                                ),
                              ])
                        ])
                  ]));
        }),
      );
    });

    // how do I get this thing to go into the center?
    // body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    //   Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
    //     children: [
    //       ElevatedButton(
    //           onPressed: () {
    //             Phoenix.rebirth(context);
    //           },
    //           child: Text("Log Out")),
    //     ],
    //   ),
    //   Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
    //     const Text("Theme: "),
    //     ThemeField(
    //       initialValue: context.watch<ThemeChange>().mode,
    //       onChanged: (value) => context.read<ThemeChange>().mode = value,
    //     ),
    //   ])
    // ]));
  }
}
