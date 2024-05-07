import 'package:chat_app/themes/dark_theme.dart';
import 'package:chat_app/themes/litht_theme.dart';
import 'package:flutter/material.dart';

class ThemeServis extends ChangeNotifier{
  ThemeData _themeData = ligthMode;

  ThemeData get themeData => _themeData;
  bool get isDarkMode => _themeData == darkMode;
  set themeData(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == ligthMode) {
      themeData = darkMode;
    }
    else {
      themeData = ligthMode;
    }
  }
}