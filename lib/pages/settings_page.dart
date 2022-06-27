import 'package:app_prototype/models/theme_change.dart';
import 'package:app_prototype/widgets/theme_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  var themeValue = "light";
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("settings"),
        ),

        // how do I get this thing to go into the center?
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            const Text("Theme: "),
            ThemeField(
              initialValue: context.watch<ThemeChange>().mode,
              onChanged: (value) => context.read<ThemeChange>().mode = value,
            ),
          ])
        ]));
  }
}
