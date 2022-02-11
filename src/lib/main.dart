import 'package:flutter/material.dart';
import 'package:demo/themes/constants.dart';
import 'pages/pet_type_selection.dart';

void main() {
  // if user profile file has data
  // runApp(HomeScreen)
  // else
  runApp(MaterialApp(
    theme: kDefaultTheme,
    title: 'Landing Page',
    home: const PetTypeSelection(),
  ));
}
