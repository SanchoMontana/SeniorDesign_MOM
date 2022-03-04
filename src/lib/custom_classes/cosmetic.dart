import 'package:flutter/material.dart';

enum CosmeticType { hat, body, shoes, accessory }
List<Cosmetic> cosmeticList = <Cosmetic>[
  Cosmetic(1, CosmeticType.hat, "hat", "HAT"),
  Cosmetic(2, CosmeticType.body, "body", "BODY"),
  Cosmetic(3, CosmeticType.shoes, "shoes", "SHOES"),
  Cosmetic(4, CosmeticType.accessory, "accessory", "ACCESSORY")
];

class Cosmetic {
  // ignore: non_constant_identifier_names
  late int ID;
  late CosmeticType type;
  late String displayName;
  late String fullName;
  Cosmetic(this.ID, this.type, this.displayName, this.fullName);
  @override
  String toString() {
    // ignore: unnecessary_this
    switch (this.type) {
      case CosmeticType.hat:
        return "hat";
      case CosmeticType.body:
        return "body";
      case CosmeticType.shoes:
        return "shoes";
      case CosmeticType.accessory:
        return "accessory";
    }
  }
}
