import 'package:flutter/material.dart';
import 'package:reports/config/colors_const.dart';

class ThemeApp {
  static ThemeData themeLigth = ThemeData(
    scaffoldBackgroundColor: ColorsConst.background,
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: ColorsConst.textColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        color: ColorsConst.textColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      headline3: TextStyle(
        color: ColorsConst.textColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      headline4: TextStyle(
        color: ColorsConst.textColor,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      headline5: TextStyle(
        color: ColorsConst.textColor,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      headline6: TextStyle(
        color: ColorsConst.textColor,
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: TextStyle(
        color: ColorsConst.textColor,
        fontSize: 14,
      ),
      bodyText2: TextStyle(
        color: ColorsConst.textColor,
        fontSize: 12,
      ),
      subtitle1: TextStyle(
        color: ColorsConst.textColor,
        fontSize: 14,
      ),
      subtitle2: TextStyle(
        color: ColorsConst.textColor,
        fontSize: 12,
      ),
      caption: TextStyle(
        color: ColorsConst.textColor,
        fontSize: 12,
      ),
      button: TextStyle(
        color: ColorsConst.textColor,
        fontSize: 14,
      ),
      overline: TextStyle(
        color: ColorsConst.textColor,
        fontSize: 12,
      ),
    ),
  );
}

extension CustomTheme on ThemeData {
  // TextStyle get textStyleButtonNormal => const TextStyle(
  //     fontWeight: FontWeight.bold,
  //     fontSize: 12,
  //     fontFamily: "SourceSansPro",
  //     color: ColorsUrth.primary);

}
