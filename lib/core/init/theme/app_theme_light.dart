import 'package:flutter/material.dart';

import '../../constants/app/app_constant.dart';
import 'app_theme.dart';
import 'light/ilight_theme_interface.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    return _instance ??= AppThemeLight._init();
  }

  AppThemeLight._init();
  // ThemeData get theme => redTheme;
  @override
  ThemeData get theme => ThemeData(
        fontFamily: ApplicationConstants.FONT_FAMILY,
        colorScheme: _appColorsScheme,
        scaffoldBackgroundColor: Color(0xfff1f3f8),
        textTheme: textTheme(),
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
              brightness: Brightness.light,
              color: Colors.transparent,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black87, size: 21),
            ),
        inputDecorationTheme: InputDecorationTheme(
          focusColor: Colors.black12,
          labelStyle: TextStyle(),
          fillColor: Colors.white,
          contentPadding: EdgeInsets.zero,
          filled: true,
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 0.3)),
          // border: OutlineInputBorder(borderSide: BorderSide(width: 0.1)),
          focusedBorder: OutlineInputBorder(),
        ),
        tabBarTheme: tabBarTheme,
        floatingActionButtonTheme: ThemeData.light().floatingActionButtonTheme,
        buttonTheme: ThemeData.light().buttonTheme.copyWith(
              colorScheme: ColorScheme.light(
                onError: Color(0xffff2d55),
              ),
            ),
      );

  TabBarTheme get tabBarTheme {
    return TabBarTheme(
      labelPadding: paddingInsetsAll.lowPaddingAll,
      labelColor: _appColorsScheme.onSecondary,
      labelStyle: textThemeLight!.headline5,
      unselectedLabelColor: _appColorsScheme.onSecondary.withOpacity(0.2),
      // unselectedLabelStyle: textThemeLight.headline4.copyWith(color: colorSchemeLight.gray),
    );
  }

  TextTheme textTheme() {
    return ThemeData.light().textTheme.copyWith(
          headline1: textThemeLight!.headline1,
          headline2: textThemeLight!.headline2,
          overline: textThemeLight!.overline,
        );
  }

  ColorScheme get _appColorsScheme {
    return ColorScheme(
      primary: colorSchemeLight!.black,
      primaryVariant: Colors.white,
      secondary: Colors.yellow,
      secondaryVariant: colorSchemeLight!.azure,
      surface: Colors.deepOrange,
      background: Color(0xfff6f9fc),
      error: Colors.redAccent,
      onPrimary: Colors.black,
      onSecondary: Colors.amber,
      onSurface: Colors.indigoAccent,
      onBackground: Colors.black12,
      onError: Color(0xFFFABD23),
      brightness: Brightness.light,
    );
  }
}
