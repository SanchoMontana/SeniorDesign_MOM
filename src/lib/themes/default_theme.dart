import 'package:flutter/material.dart';

Color textButtonColor = Colors.deepPurple[300]!;
Color textButtonSelectedColor = Colors.deepPurple[800]!;
Color textButtonTextColor = Colors.black87;

class DefaultTheme {
  static ThemeData get defaultTheme {
    return ThemeData(
      primaryColor: Colors.purple,
      scaffoldBackgroundColor: Colors.lightGreen,
      fontFamily:
          'Montserrat', //doesn't actually work because i dont have this font installed
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
