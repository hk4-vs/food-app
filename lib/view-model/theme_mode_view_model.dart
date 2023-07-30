import 'package:flutter/material.dart';

class ThemeModeViewModel extends ChangeNotifier {
  ThemeMode _mode = ThemeMode.light;
  ThemeMode get themeMode => _mode;
  bool isLight = true;
  changeMode() {
    isLight = !isLight;
    if (isLight) {
      _mode = ThemeMode.light;
      notifyListeners();
    } else {
      _mode = ThemeMode.dark;
      notifyListeners();
    }
  }
  // ThemeMode _themeMode = ThemeMode.system; // Default to system theme

  // ThemeMode get themeMode => _themeMode;

  // void setThemeMode(ThemeMode mode) {
  //   _themeMode = mode;
  //   notifyListeners();
  // }
}
