import 'package:app_prototype/models/theme_change.dart';
import 'package:app_prototype/widgets/theme_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("settings"),
        ),

        // how do I get this thing to go into the center?
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
            const Text("Theme: "),
            ThemeField(
              initialValue: context.watch<ThemeChange>().mode,
              onChanged: (value) => context.read<ThemeChange>().mode = value,
            ),
          ])
        ]));
  }
}
