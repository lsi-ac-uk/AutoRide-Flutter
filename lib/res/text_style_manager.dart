import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_manager.dart';

class TextStyleManager {
  TextStyleManager._();

  static TextStyle splashScreenMain = GoogleFonts.inter(
      fontSize: 40, color: ColorManager.textColor, fontWeight: FontWeight.bold);

  static TextStyle screenText = GoogleFonts.inter(
      fontSize: 30,
      color: ColorManager.textColor,
      fontWeight: FontWeight.normal);

  static TextStyle buttonText = GoogleFonts.inter(
      fontSize: 20,
      color: ColorManager.textColor,
      fontWeight: FontWeight.normal);

  static TextStyle messageText = GoogleFonts.inter(
      fontSize: 15,
      color: ColorManager.textColor,
      fontWeight: FontWeight.normal);

  static TextStyle titleText = GoogleFonts.inter(
      fontSize: 18, color: ColorManager.textColor, fontWeight: FontWeight.bold);

  static TextStyle textFieldCaption = GoogleFonts.inter(
      fontSize: 15, color: ColorManager.hintTextColor, fontWeight: FontWeight.bold);

  static TextStyle textFieldTitle = GoogleFonts.inter(
      fontSize: 15, color: ColorManager.textColor, fontWeight: FontWeight.bold);


  static TextStyle appBarText = GoogleFonts.inter(
      fontSize: 20, color: ColorManager.textColor, fontWeight: FontWeight.bold);
}
