import 'package:demo/custom_classes/pet.dart';
import 'package:flutter/material.dart';

// want to make this upper case because its a widget
// ignore: non_constant_identifier_names
SizedBox PetWidget(Pet userPet) {
  return SizedBox(
      width: 200,
      height: 400,
      // TODO: make this a stack with cosmetics on top of pet
      child: Image(
        image: userPet.pet,
      ));
}
