import 'package:flutter/material.dart';

import 'app_theme.dart';

class AppThemeLight extends AppTheme {
  static AppThemeLight _instance;
  static AppThemeLight get instance {
    if (_instance == null) _instance = AppThemeLight._init();
    return _instance;
  }

  AppThemeLight._init();
  ThemeData get theme => ThemeData.light();
}
