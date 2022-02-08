import 'package:flutter/material.dart';

SizedBox customTextButton(String buttonText, void Function()? onPressed,
    {double width = 140, Key? k}) {
  return SizedBox(
    width: width,
    child: TextButton(
      onPressed: onPressed,
      child: Text(buttonText, key: k),
    ),
  );
}
