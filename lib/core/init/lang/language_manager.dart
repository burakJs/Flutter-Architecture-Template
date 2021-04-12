import 'package:flutter/rendering.dart';

class LanguageManager {
  static LanguageManager _instance;
  static LanguageManager get instance {
    _instance ??= LanguageManager._init();
    return _instance;
  }

  LanguageManager._init();

  final enLocale = Locale('en', 'US');

  List<Locale> get supportedLocales => [enLocale];
}
