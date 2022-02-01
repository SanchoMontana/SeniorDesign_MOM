import 'package:flutter/material.dart';

final Color kTextButtonColor = Colors.deepPurple[300]!;
final kTextButtonSelectedColor = Colors.deepPurple[800]!;
final kTextButtonTextColor = Colors.black87;

final ThemeData kDefaultTheme = ThemeData(
  primaryColor: Colors.purple,
  scaffoldBackgroundColor: Colors.lightGreen,
  fontFamily: 'Montserrat', //TODO: install this font
  cardColor: Colors.blueGrey[500],
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(kTextButtonColor),
      foregroundColor: MaterialStateProperty.all(kTextButtonTextColor),
    ),
  ),
);

final ButtonStyle kTextButtonSelectedTheme = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(kTextButtonSelectedColor),
  foregroundColor: MaterialStateProperty.all(kTextButtonTextColor),
);
