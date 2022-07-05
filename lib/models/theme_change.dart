import 'package:app_prototype/theme/light_mode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/dark_mode.dart';

class ThemeChange extends ChangeNotifier {
  ThemeMode _mode = ThemeMode.system;
  
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
