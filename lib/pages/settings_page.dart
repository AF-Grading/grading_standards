import 'package:app_prototype/models/CurrentUser.dart';
import 'package:app_prototype/models/theme_change.dart';
import 'package:app_prototype/models/user_profile.dart';
import 'package:app_prototype/widgets/theme_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class SettingsPage extends StatelessWidget {
  final dark_mode_icon = CupertinoIcons.moon_circle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("settings"),
          elevation: 0,
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(
            Icons.pets,
            size: 300,
          ),
          Text(
            context.watch<CurrentUser>().user.name,
          ),
          Text(
            "email:    " + context.watch<CurrentUser>().user.email,
          ),
          Text(
            "squadron:    " + context.watch<CurrentUser>().user.squad,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Phoenix.rebirth(context);
                  },
                  child: Text("Log Out")),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Wrap(
                direction: Axis.horizontal,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Text("Theme:         "),
                  ThemeField(
                    initialValue: context.watch<ThemeChange>().mode,
                    onChanged: (value) =>
                        context.read<ThemeChange>().mode = value,
                  ),
                ])
          ])
        ]));

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
