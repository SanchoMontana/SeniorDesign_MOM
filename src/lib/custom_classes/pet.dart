import 'dart:core';

import 'cosmetic.dart';

enum PetType { bird, cat, dog }

class Pet {
  late PetType type;
  late String name;
  late Cosmetic head;
  late Cosmetic body;
  late Cosmetic shoes;
  late Cosmetic accessory;
  late List<Cosmetic> cosmetics;

  Pet();
  Pet.build(this.type, this.name, this.head, this.body, this.shoes,
      this.accessory, this.cosmetics);
}
