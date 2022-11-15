import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reports/config/colors_const.dart';

class ThemeApp {
  static ThemeData themeLigth = ThemeData(
    scaffoldBackgroundColor: ColorsConst.background,
    colorScheme: ColorScheme.fromSeed(seedColor: ColorsConst.background),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: ColorsConst.textColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontFamily: GoogleFonts.zillaSlab().fontFamily,
      ),
      headline2: TextStyle(
        color: ColorsConst.textColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: GoogleFonts.zillaSlab().fontFamily,
      ),
      headline3: TextStyle(
        fontFamily: GoogleFonts.zillaSlab().fontFamily,
        color: ColorsConst.textColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      headline4: TextStyle(
        fontFamily: GoogleFonts.zillaSlab().fontFamily,
        color: ColorsConst.textColor,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      headline5: TextStyle(
        fontFamily: GoogleFonts.zillaSlab().fontFamily,
        color: ColorsConst.textColor,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      headline6: TextStyle(
        fontFamily: GoogleFonts.zillaSlab().fontFamily,
        color: ColorsConst.textColor,
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: TextStyle(
        fontFamily: GoogleFonts.zillaSlab().fontFamily,
        color: ColorsConst.textColor,
        fontSize: 14,
      ),
      bodyText2: TextStyle(
        fontFamily: GoogleFonts.zillaSlab().fontFamily,
        color: ColorsConst.textColor,
        fontSize: 12,
      ),
      subtitle1: TextStyle(
        fontFamily: GoogleFonts.zillaSlab().fontFamily,
        color: ColorsConst.textColor,
        fontSize: 14,
      ),
      subtitle2: TextStyle(
        fontFamily: GoogleFonts.zillaSlab().fontFamily,
        color: ColorsConst.textColor,
        fontSize: 12,
      ),
      caption: TextStyle(
        fontFamily: GoogleFonts.zillaSlab().fontFamily,
        color: ColorsConst.textColor,
        fontSize: 12,
      ),
      button: TextStyle(
        fontFamily: GoogleFonts.zillaSlab().fontFamily,
        color: ColorsConst.textColor,
        fontSize: 14,
      ),
      overline: TextStyle(
        fontFamily: GoogleFonts.zillaSlab().fontFamily,
        color: ColorsConst.textColor,
        fontSize: 12,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: ColorsConst.background,
        textStyle: TextStyle(
          fontFamily: GoogleFonts.zillaSlab().fontFamily,
          color: ColorsConst.textColor,
          fontSize: 14,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(
            color: ColorsConst.textColor,
            width: 1,
          ),
        ),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ColorsConst.textColor,
      selectionColor: Colors.white,
      selectionHandleColor: ColorsConst.textColor,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      errorBorder: InputBorder.none,
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
