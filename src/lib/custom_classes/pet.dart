import 'dart:core';

import 'package:flutter/material.dart';

import 'cosmetic.dart';

enum PetType { bird, cat, dog }

class Pet {
  late PetType type;
  late String name;
  late Cosmetic head;
  late Cosmetic body;
  late Cosmetic shoes;
  late Cosmetic accessory;
  late int headx;
  late int heady;
  late int bodyx;
  late int bodyy;
  late int shoesx;
  late int shoesy;
  late int accessoryx;
  late int accessoryy;
  late List<Colors> colors;
  late List<Cosmetic> cosmetics;
  late AssetImage pet;

  Pet();
  Pet.construct(this.type, this.name, this.head, this.body, this.shoes,
      this.accessory, this.cosmetics, this.pet);
}
