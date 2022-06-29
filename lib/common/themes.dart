import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Themes {
  /// theme data colors
  /// [primarySwatchLight], [primaryColorLight] are to be used in light mode
  /// [primarySwatchDark], [primaryColorDark] are to be used in dark mode
  /// [validColor] and [errorColor] are colors used in validating items in auth screens

  // common theme colors
  static MaterialColor? primarySwatchLight = Colors.indigo;
  static MaterialColor? primarySwatchDark = Colors.pink;
  static Color primaryColorLight = Colors.blueGrey.shade50;
  static Color primaryColorDark = Colors.blueGrey.shade900;
  static Color accentColor = Colors.pinkAccent;

  // auth screens validation colors
  static Color? validColor = Colors.green[700];
  static Color? errorColor = Colors.red[700];

  /// [setStatNavBarsStyle] gets [SystemUiOverlayStyle] according to bool [_isLightMode] which is a [MediaQuery] getting the [platformBrightness] of [context]
  /// makes [statusBar] and [systemNavigationBar] respond to system mode (dark or light)
  /// TODO: this method is to be used in each class which is boilerplate, need to learn more about state management and consider using [GetX], [BLoC] or [Provider]

  // system overlay style that will be shown while using light mode
  static SystemUiOverlayStyle lightModeSystemUIOverlay =
      SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Themes.primaryColorLight,
    systemNavigationBarIconBrightness: Brightness.dark,
  );

  // system overlay style that will be shown while using dark mode
  static SystemUiOverlayStyle darkModeSystemUIOverlay =
      SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    systemNavigationBarColor: Themes.primaryColorDark,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  // to make system overlay respond to system theme (to show the correct overlay when light mode or dark mode is used)
  static void setStatNavBarsStyle(bool _isLightMode) {
    _isLightMode
        ? SystemChrome.setSystemUIOverlayStyle(Themes.lightModeSystemUIOverlay)
        : SystemChrome.setSystemUIOverlayStyle(Themes.darkModeSystemUIOverlay);
  }

  /// [light] gets light mode style using [lightThemeData]

  // to get the light theme in main method
  static ThemeData light() => Themes.lightThemeData;

  // light theme data
  static ThemeData lightThemeData = ThemeData(
    brightness: Brightness.light,
    primaryColor: Themes.primaryColorDark,
    primarySwatch: Themes.primarySwatchLight,
    scaffoldBackgroundColor: Themes.primaryColorLight,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: lightModeSystemUIOverlay,
      elevation: 0,
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
          color: Themes.primaryColorDark,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold),
      toolbarTextStyle: TextStyle(color: Themes.primaryColorDark),
    ),
    buttonTheme: ButtonThemeData(
      colorScheme:
          ColorScheme.fromSwatch().copyWith(brightness: Brightness.dark),
      minWidth: double.infinity,
      buttonColor: Themes.primarySwatchDark,
    ),
  );

  /// [dark] gets dark mode style using [darkThemeData]

  // to get the dark theme in main method
  static ThemeData dark() => Themes.darkThemeData;

  // dark theme data
  static ThemeData darkThemeData = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Themes.primaryColorLight,
    primarySwatch: Themes.primarySwatchDark,
    scaffoldBackgroundColor: Themes.primaryColorDark,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: darkModeSystemUIOverlay,
      elevation: 0,
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
          color: Themes.primaryColorLight,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold),
      toolbarTextStyle: TextStyle(color: Themes.primaryColorLight),
    ),
    buttonTheme: ButtonThemeData(
      colorScheme:
          ColorScheme.fromSwatch().copyWith(brightness: Brightness.dark),
      minWidth: double.infinity,
      buttonColor: Themes.primarySwatchDark,
    ),
  );
}
