import 'package:flutter/material.dart';

import '../../constants/app/app_constant.dart';
import 'app_theme.dart';
import 'light/ilight_theme_interface.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight _instance;
  static AppThemeLight get instance {
    if (_instance == null) _instance = AppThemeLight._init();
    return _instance;
  }

  AppThemeLight._init();
  // ThemeData get theme => redTheme;
  ThemeData get theme => ThemeData(
        fontFamily: ApplicationConstants.FONT_FAMILY,
        colorScheme: _appColorsScheme(),
        textTheme: textTheme(),
        tabBarTheme: TabBarTheme(
          labelPadding: paddingInsetsAll.lowPaddingAll,
          unselectedLabelStyle: textThemeLight.headline4.copyWith(color: colorSchemeLight.gray),
        ),
        floatingActionButtonTheme: ThemeData.light().floatingActionButtonTheme,
      );

  TextTheme textTheme() {
    return TextTheme(
      headline1: textThemeLight.headline1,
      headline2: textThemeLight.headline2,
      overline: textThemeLight.overline,
    );
  }

  ColorScheme _appColorsScheme() {
    return ColorScheme(
      primary: colorSchemeLight.black,
      primaryVariant: Colors.white,
      secondary: Colors.yellow,
      secondaryVariant: Colors.green,
      surface: Colors.deepOrange,
      background: Colors.purple,
      error: Colors.redAccent,
      onPrimary: Colors.black,
      onSecondary: Colors.amber,
      onSurface: Colors.indigoAccent,
      onBackground: Colors.black12,
      onError: Colors.cyanAccent,
      brightness: Brightness.light,
    );
  }
}
