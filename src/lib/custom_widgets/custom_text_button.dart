import 'package:flutter/material.dart';

ButtonStyle customTextButtonStyle = ButtonStyle(
    foregroundColor: MaterialStateProperty.all(Colors.white70),
    backgroundColor: MaterialStateProperty.all(Colors.deepPurple[300]));

SizedBox customTextButton(String buttonText) {
  return SizedBox(
    width: 140,
    child: TextButton(
      style: customTextButtonStyle,
      // ignore: avoid_print
      onPressed: () => print("test"),
      child: Text(buttonText),
    ),
  );
}
