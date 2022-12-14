import 'package:flutter/material.dart';

class ColorPalettes {
  const ColorPalettes._();

  // Primary
  static const _primaryValue = 0xff00828C;
  static const primary = Color(_primaryValue);
  // Primary Dark
  static const _primaryDarkValue = 0xff0F1616;
  static const primaryDark = Color(_primaryDarkValue);

  // Black
  static const black = Color(0xff313450);
  static Color blackShadow = Colors.black.withOpacity(0.25);

  // Grey
  static const grey = Color(0xff94a5a6);
  static const grey2 = Color(0xff707070);
  static const grey3 = Color(0xffDBDBDB);
  static const grey4 = Color(0xff726965);
  static const grey5 = Color(0xffE0E0E0);
  static const grey6 = Color(0xffD9D9D9);
  static const grey7 = Color(0xffABABAB);
  static const grey8 = Color(0xff3A3A3A);

  static const darkGrey = Color(0xff898a8f);
  static const greyDark100 = Color(0xff424242);
  static Color grey75 = greyDark100.withOpacity(0.75);
  static Color grey25 = greyDark100.withOpacity(0.25);
  static const bgGrey = Color(0xffFBFBFB);
  static const bgGrey2 = Color(0xffF8F8F8);
  static const bgGrey3 = Color(0xffB3B3B3);
  static const bgGrey4 = Color(0xffF7F7F7);

  // Green
  static const green = Color(0xff2B9D21);
  static Color bgGreen50 = const Color(0xffB9FFC4).withOpacity(0.5);

  // Gold
  static const gold = Color(0xffBD9B30);
  static const goldLight = Color(0xffFFF7DE);
  static const goldDark = Color(0xffAB8100);
  static const goldDark2 = Color(0xff60432D);
  static const goldDark3 = Color(0xff8B6B08);

  // Purple
  static Color purple = const Color(0XFFE5CAFF);
  static Color purple2 = const Color(0XFF9327FF);

  // Widget
  static const divider = Color(0xffECECEC);
  static const dividerDark = Color(0xff555555);
  static const divider2 = Color(0xffB5B5B5);
  static const greyText = Color(0xff858585);
  static Color greyText2 = const Color(0xff404040).withOpacity(0.6);
  static Color greyText3 = const Color(0xff414141);
  static Color greyText4 = const Color(0xff9D9D9D);
  static Color greyText5 = const Color(0xff797979);
  static Color greyText6 = const Color(0xff575757);
  static Color shadowCard = const Color(0xff2B2B2B).withOpacity(0.25);

  // Swatch
  static const primarySwatch = MaterialColor(
    _primaryValue,
    <int, Color>{
      50: Color(_primaryValue),
      100: Color(_primaryValue),
      200: Color(_primaryValue),
      300: Color(_primaryValue),
      400: Color(_primaryValue),
      500: Color(_primaryValue),
      600: Color(_primaryValue),
      700: Color(_primaryValue),
      800: Color(_primaryValue),
      900: Color(_primaryValue),
    },
  );

  static const primaryDarkSwatch = MaterialColor(
    _primaryDarkValue,
    <int, Color>{
      50: Color(_primaryDarkValue),
      100: Color(_primaryDarkValue),
      200: Color(_primaryDarkValue),
      300: Color(_primaryDarkValue),
      400: Color(_primaryDarkValue),
      500: Color(_primaryDarkValue),
      600: Color(_primaryDarkValue),
      700: Color(_primaryDarkValue),
      800: Color(_primaryDarkValue),
      900: Color(_primaryDarkValue),
    },
  );

  // Advanced Switch Theme
  static const darkThumbColor = Color(0xff525252);
  static const darkTrackColor = Color(0xffDDDDDD);

  // Ligh Background
  static const lightBackground = Color(0xffE2E6E9);

  // Dark Background
  static const darkBackground = Color(0xff002C30);

  static const greyBoxUsername = Color(0xffCCCCCC);

  static const orange1 = Color(0xffFD6A03);
  static const orange2 = Color(0xffEE3A22);
  static const orange3 = Color(0xffF99205);

  static const blue1 = Color(0xff0376F7);
  static const blue2 = Color(0xff62ACFF);
  static const blue3 = Color(0xff1A2B3E);

  static const yellow1 = Color(0xffFED932);
  static const yellow2 = Color(0xff7E7B4F);

  static const red1 = Color(0xffE1383F);

  static const greyDropdown = Color(0xff707070);

  // Legend Truck Color
  // static const lightLegendInMotion = Color(0xff000000);
  // static const lightLegendIdle = Color(0xff707070);
  // static const lightLegendQueeing = Color(0xff969696);
  // static const lightLegendParked = Color(0xffAFACAC);

  static const darkLegendInMotion = Color(0xff00828C);
  static const darkLegendIdle = Color(0xffFED932);
  static const darkLegendQueeing = Color(0xffFD6A03);
  static const darkLegendParked = Color(0xffE1383F);

  // Top Menu Color
  static const selectedMenuColor = Color(0xffE2E6E9);
  static const indicatorMenuColor = Color(0xffE1383F);

  static const white2 = Color(0xffEFEFEF);
}
