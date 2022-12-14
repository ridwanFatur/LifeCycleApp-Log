import 'package:flutter/material.dart';

import 'color_palettes.dart';
import 'text_styles.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'Inter',
    brightness: Brightness.light,
    primaryColor: ColorPalettes.primary,
    dividerColor: ColorPalettes.divider,
    primarySwatch: ColorPalettes.primarySwatch,
    scaffoldBackgroundColor: ColorPalettes.bgGrey,
    appBarTheme: const AppBarTheme().copyWith(
      color: Colors.white,
      titleTextStyle: kLightTextTheme.headline6?.copyWith(
        color: ColorPalettes.primary,
      ),
      iconTheme: const IconThemeData().copyWith(
        color: ColorPalettes.primary,
      ),
    ),
    textTheme: kLightTextTheme,
    scrollbarTheme: ScrollbarThemeData(
      trackBorderColor: MaterialStateProperty.all(Colors.black),
      thumbColor: MaterialStateProperty.all(const Color(0xFF555555)),
      trackColor: MaterialStateProperty.all(Colors.white),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    fontFamily: 'Inter',
    brightness: Brightness.dark,
    primaryColor: ColorPalettes.primaryDark,
    dividerColor: ColorPalettes.dividerDark,
    primarySwatch: ColorPalettes.primaryDarkSwatch,
    scaffoldBackgroundColor: ColorPalettes.primaryDark,
    appBarTheme: const AppBarTheme().copyWith(
      color: Colors.white,
      titleTextStyle: kLightTextTheme.headline6?.copyWith(
        color: ColorPalettes.primary,
      ),
      iconTheme: const IconThemeData().copyWith(
        color: ColorPalettes.primary,
      ),
    ),
    textTheme: kDarkTextTheme,
    scrollbarTheme: ScrollbarThemeData(
      trackBorderColor: MaterialStateProperty.all(Colors.white),
      thumbColor: MaterialStateProperty.all(ColorPalettes.primary),
      trackColor: MaterialStateProperty.all(Colors.black),
    ),
  );
}
