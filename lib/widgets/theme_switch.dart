import 'package:flutter/material.dart';
import '../models/theme_change.dart';

class ThemeSwitch extends StatefulWidget {
  @override
  SwitchClass createState() => new SwitchClass();
}

class SwitchClass extends State {
  bool isSwitched = false;
  var themeValue = "light";
  // var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        themeValue = "dark";
        // textValue = 'Switch Button is ON';
      });
      // print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        themeValue = "light";
        // textValue = 'Switch Button is OFF';
      });
      // print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Transform.scale(
          scale: 2,
          child: Switch(
            onChanged: toggleSwitch,
            value: isSwitched,
            activeColor: Colors.blue,
            activeTrackColor: Colors.yellow,
            inactiveThumbColor: Colors.redAccent,
            inactiveTrackColor: Colors.orange,
          )),
      Text(
        '$themeValue',
        style: TextStyle(fontSize: 20),
      )
    ]);
  }
}