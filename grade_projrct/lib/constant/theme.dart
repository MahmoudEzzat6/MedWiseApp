import 'package:flutter/material.dart';
import 'package:grade_projrct/constant/const.dart';

class ThemesApp {
  static final light = ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: mainColor,
        elevation: 0,
      ),
      primaryColor: mainColor,
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      iconTheme: const IconThemeData(color: Colors.white),
      buttonTheme: ButtonThemeData(buttonColor: mainColor),
      textSelectionTheme: TextSelectionThemeData(selectionColor: mainColor));
}
