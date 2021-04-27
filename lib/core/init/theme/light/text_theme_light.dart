import 'package:flutter/material.dart';

class TextThemeLight {
  static TextThemeLight? _instance;
  static TextThemeLight? get instance {
    _instance ??= TextThemeLight._init();
    return _instance;
  }

  TextThemeLight._init();

  final TextStyle headline1 = TextStyle(fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5);
  final TextStyle headline2 = TextStyle(fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5);
  final TextStyle headline3 = TextStyle(fontSize: 48, fontWeight: FontWeight.w400);
  final TextStyle headline4 = TextStyle(fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: .25);
  final TextStyle headline5 = TextStyle(fontSize: 24, fontWeight: FontWeight.w400);
  final TextStyle overline = TextStyle(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5);
}
