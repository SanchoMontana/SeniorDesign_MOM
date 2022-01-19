import 'package:flutter/material.dart';

class DefaultTheme {
  static ThemeData get defaultTheme { //1
    return ThemeData( //2
      primaryColor: Colors.purple,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Montserrat', //3
      buttonTheme: ButtonThemeData( // 4
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        buttonColor: CustomColors.lightPurple,
      )
    );
  }
}