import 'package:flutter/material.dart';

final Color kTextButtonColor = Colors.deepPurple[300]!;
final Color kTextButtonSelectedColor = Colors.deepPurple[800]!;
final Color kTextButtonTextColor = Colors.black87;

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

const TextStyle kErrorTextStyle = TextStyle(color: Color(0xFFd13030));

const kErrorBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: Color(0xFFd13030),
    width: 1.2,
  ),
);

const kEnabledBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: Color(0xFF000000),
    width: 1,
  ),
);

const kFocusedBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: Color(0xFF2196F3),
    width: 1,
  ),
);

const kFocusedErrorBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: Color(0xFFd13030),
    width: 1,
  ),
);
