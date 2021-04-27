import 'package:flutter/rendering.dart';

class LanguageManager {
  static LanguageManager? _instance;
  static LanguageManager get instance {
    return _instance ??= LanguageManager._init();
  }

  LanguageManager._init();

  final enLocale = Locale('en', 'US');
  final trLocale = Locale('tr', 'TR');

  List<Locale> get supportedLocales => [enLocale, trLocale];
}
