import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app1/config/theme/general_app_colors.dart';

class UIThemes {
  final Brightness brightness;

  UIThemes({this.brightness = Brightness.light});

  static ThemeData lightTheme() => ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: LightModeColors.white,
    dialogTheme: DialogThemeData(
      elevation: 0,
      backgroundColor: LightModeColors.whiteGreen,
    ),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      centerTitle: true,
      backgroundColor: LightModeColors.white,
      elevation: 0,
    ),
  );

  static ThemeData darkTheme() => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: DarkModeColors.whiteGreen,
    dividerColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      centerTitle: true,
      backgroundColor: DarkModeColors.whiteGreen,
      elevation: 0,
    ),
  );

  static UIThemes of(BuildContext context) {
    return UIThemes(brightness: Theme.of(context).brightness);
  }

  bool get isDarkTheme => brightness == Brightness.dark;

  Color get blackColor =>
      isDarkTheme ? DarkModeColors.black : LightModeColors.black;

  Color get greenDark100 =>
      isDarkTheme ? DarkModeColors.greenDark100 : LightModeColors.greenDark100;

  Color get greenDark70 =>
      isDarkTheme ? DarkModeColors.greenDark70 : LightModeColors.greenDark70;

  Color get greenDark50 =>
      isDarkTheme ? DarkModeColors.greenDark50 : LightModeColors.greenDark50;

  Color get greenDark20 =>
      isDarkTheme ? DarkModeColors.greenDark20 : LightModeColors.greenDark20;

  Color get whiteGreen =>
      isDarkTheme ? DarkModeColors.whiteGreen : LightModeColors.whiteGreen;

  Color get white => isDarkTheme ? DarkModeColors.white : LightModeColors.white;

  Color get grey => isDarkTheme ? DarkModeColors.grey : LightModeColors.grey;

  Color get lightGrey =>
      isDarkTheme ? DarkModeColors.lightGrey : LightModeColors.lightGrey;

  Color get red => isDarkTheme ? DarkModeColors.red : LightModeColors.red;

  Color get yellow =>
      isDarkTheme ? DarkModeColors.yellow : LightModeColors.yellow;

  Color get blueDark =>
      isDarkTheme ? DarkModeColors.blueDark : LightModeColors.blueDark;

  Color get background =>
      isDarkTheme ? DarkModeColors.black : LightModeColors.white;

  Color get backgroundDisable =>
      isDarkTheme ? DarkModeColors.lightGrey : LightModeColors.lightGrey;

  TextStyle getBold16DarkGreen(BuildContext context) {
    return TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      color: greenDark100,
    );
  }

  TextStyle getBold24DarkGreen(BuildContext context) {
    return TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.w700,
      color: greenDark100,
    );
  }

  TextStyle getBold16Black(BuildContext context) {
    return TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      color: blackColor,
    );
  }

  TextStyle getBold16WhiteGreen(BuildContext context) {
    return TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      color: whiteGreen,
    );
  }

  TextStyle getBold16White(BuildContext context) {
    return TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700, color: white);
  }

  TextStyle getBold16Green20(BuildContext context) {
    return TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      color: greenDark20,
    );
  }

  TextStyle getBold16Red(BuildContext context) {
    return TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: red);
  }
}
