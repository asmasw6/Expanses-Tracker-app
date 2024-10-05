import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _lightModeEnable = true;

  bool get getlightModeEnable => _lightModeEnable;

  set lightModeEnable(bool value) {
    _lightModeEnable = value;
  }

  changeMode() {
    _lightModeEnable = !getlightModeEnable;
    notifyListeners();
  }
}
