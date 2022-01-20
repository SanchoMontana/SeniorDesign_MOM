import 'package:flutter/material.dart';

SizedBox customTextButton(String buttonText, Function() onPressed,
    {double width = 140, ButtonStyle? style}) {
  return SizedBox(
    width: width,
    child: TextButton(
      style: style,
      onPressed: onPressed,
      child: Text(buttonText),
    ),
  );
}
