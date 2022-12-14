import 'package:flutter/material.dart';

import 'color_palettes.dart';

// Please see the README for how to use

/// NAME         SIZE  WEIGHT  SPACING
/// headline1    96.0  light   -1.5
/// headline2    60.0  light   -0.5
/// headline3    48.0  regular  0.0
/// headline4    34.0  regular  0.25
/// headline5    24.0  regular  0.0
/// headline6    20.0  medium   0.15
/// subtitle1    16.0  regular  0.15
/// subtitle2    14.0  medium   0.1
/// body1        16.0  regular  0.5   (bodyText1)
/// body2        14.0  regular  0.25  (bodyText2)
/// button       14.0  medium   1.25
/// caption      12.0  regular  0.4
/// overline     10.0  regular  1.5

// text style
const TextStyle kHeadline1 = TextStyle(fontSize: 96, color: ColorPalettes.black);
const TextStyle kHeadline2 = TextStyle(fontSize: 60, color: ColorPalettes.black);
const TextStyle kHeadline3 = TextStyle(fontSize: 48, color: ColorPalettes.black, fontWeight: FontWeight.normal);
const TextStyle kHeadline4 = TextStyle(fontSize: 34, color: ColorPalettes.black, fontWeight: FontWeight.normal);
const TextStyle kHeadline5 = TextStyle(fontSize: 24, color: ColorPalettes.black, fontWeight: FontWeight.normal);
const TextStyle kHeadline6 = TextStyle(fontSize: 20, color: ColorPalettes.black, fontWeight: FontWeight.w500);
const TextStyle kSubtitle1 = TextStyle(fontSize: 16, color: ColorPalettes.black, fontWeight: FontWeight.normal);
const TextStyle kSubtitle2 = TextStyle(fontSize: 14, color: ColorPalettes.black, fontWeight: FontWeight.w500);
const TextStyle kBodyText1 = TextStyle(fontSize: 16, color: ColorPalettes.black, fontWeight: FontWeight.normal);
const TextStyle kBodyText2 = TextStyle(fontSize: 14, color: ColorPalettes.black, fontWeight: FontWeight.normal);
const TextStyle kButton = TextStyle(fontSize: 14, color: ColorPalettes.black, fontWeight: FontWeight.w500);
const TextStyle kCaption = TextStyle(fontSize: 12, color: ColorPalettes.black, fontWeight: FontWeight.normal);
const TextStyle kOverline = TextStyle(fontSize: 10, color: ColorPalettes.black, fontWeight: FontWeight.normal);

// text theme
const kLightTextTheme = TextTheme(
  headline1: kHeadline1,
  headline2: kHeadline2,
  headline3: kHeadline3,
  headline4: kHeadline4,
  headline5: kHeadline5,
  headline6: kHeadline6,
  subtitle1: kSubtitle1,
  subtitle2: kSubtitle2,
  bodyText1: kBodyText1,
  bodyText2: kBodyText2,
  caption: kCaption,
  button: kButton,
  overline: kOverline,
);

final kDarkTextTheme = TextTheme(
  headline1: kHeadline1.copyWith(color: Colors.white),
  headline2: kHeadline2.copyWith(color: Colors.white),
  headline3: kHeadline3.copyWith(color: Colors.white),
  headline4: kHeadline4.copyWith(color: Colors.white),
  headline5: kHeadline5.copyWith(color: Colors.white),
  headline6: kHeadline6.copyWith(color: Colors.white),
  subtitle1: kSubtitle1.copyWith(color: Colors.white),
  subtitle2: kSubtitle2.copyWith(color: Colors.white),
  bodyText1: kBodyText1.copyWith(color: Colors.white),
  bodyText2: kBodyText2.copyWith(color: Colors.white),
  caption: kCaption.copyWith(color: Colors.white),
  button: kButton.copyWith(color: Colors.white),
  overline: kOverline.copyWith(color: Colors.white),
);
