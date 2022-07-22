import 'package:app_prototype/models/aws_state.dart';
import 'package:app_prototype/models/current_user.dart';
import 'package:app_prototype/models/theme_change.dart';
//import 'package:app_prototype/models/user_profile.dart';
import 'package:app_prototype/widgets/theme_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import '../models/User.dart';
import '../models/application_state.dart';

class SettingsPage extends StatelessWidget {
  final dark_mode_icon = CupertinoIcons.moon_circle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
          elevation: 0,
        ),
        body: Consumer<CurrentUser>(
          builder: (context, cUser, child) {
            User? user = cUser.user;
            return user != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        const Icon(
                          Icons.pets,
                          size: 300,
                        ),
                        Text(user.name!
                            //context.watch<CurrentUser>().user!.name!,
                            ),
                        Text(
                            "email:    ${user.email}" // + context.watch<CurrentUser>().user!.email,
                            ),
                        Text("squadron:    ${user.squadronID}" // +
                            //context.watch<CurrentUser>().user!.squadronID,
                            ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  context.read<AWSState>().signOut();
                                  //context.read<ApplicationState>().signOut();
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
                                      initialValue: user.themeMode!
                                          .themeMode, //context.watch<ThemeChange>().mode,
                                      onChanged: (value) => context
                                          .read<AWSState>()
                                          .updateUserTheme(user, value),
                                      //context.read<ThemeChange>().mode = value,
                                    ),
                                  ])
                            ])
                      ])
                : const Center(child: Text("No User :("));
          },
        ));

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
