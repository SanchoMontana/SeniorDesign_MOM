import 'package:flutter/material.dart';

class DefaultTheme {
  static Color get textButtonColor => Colors.deepPurple[300]!;
  static Color get textButtonSelectedColor => Colors.deepPurple[800]!;
  static Color get textButtonTextColor => Colors.black87;

  static ThemeData get defaultTheme {
    return ThemeData(
      primaryColor: Colors.purple,
      scaffoldBackgroundColor: Colors.lightGreen,
      fontFamily: 'Montserrat', //TODO: install this font
      cardColor: Colors.blueGrey[500],
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(textButtonColor),
          foregroundColor: MaterialStateProperty.all(textButtonTextColor),
        ),
      ),
    );
  }

  static ButtonStyle get textButtonSelectedTheme {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(textButtonSelectedColor),
      foregroundColor: MaterialStateProperty.all(textButtonTextColor),
    );
  }
}
