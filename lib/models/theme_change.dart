import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeChange extends ChangeNotifier {
  

  ThemeMode _mode = ThemeMode.system;

  // add on the system thing

  // bool get dark_mode => _dark_mode;

  // ignore: non_constant_identifier_names

  set mode(ThemeMode value) {
    _mode = value;
    notifyListeners();
  }

  ThemeMode get mode => _mode;

  void toggle_dark_mode() {
    if (_mode == ThemeMode.dark) {
      _mode = ThemeMode.light;
    } else {
      _mode = ThemeMode.dark;
    }
    // _dark_mode = !_dark_mode;
    notifyListeners();
  }
}
