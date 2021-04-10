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
        colorScheme: _appColorsScheme,
        scaffoldBackgroundColor: Color(0xfff1f3f8),
        textTheme: textTheme(),
        inputDecorationTheme: InputDecorationTheme(
          focusColor: Colors.black12,
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        ),
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

  ColorScheme get _appColorsScheme {
    return ColorScheme(
      primary: colorSchemeLight.black,
      primaryVariant: Colors.white,
      secondary: Colors.yellow,
      secondaryVariant: colorSchemeLight.azure,
      surface: Colors.deepOrange,
      background: Colors.purple,
      error: Colors.redAccent,
      onPrimary: Colors.black,
      onSecondary: Colors.amber,
      onSurface: Colors.indigoAccent,
      onBackground: Colors.black12,
      onError: Color(0xffffc93c),
      brightness: Brightness.light,
    );
  }
}
