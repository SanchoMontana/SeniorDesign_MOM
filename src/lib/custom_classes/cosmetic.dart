import 'package:flutter/material.dart';

enum CosmeticType { hat, body, shoes, accessory }

class Cosmetic {
  // ignore: non_constant_identifier_names
  late int ID;
  late CosmeticType type;
  late String displayName;
  late String fullName;
  late AssetImage cosmetic;
  Cosmetic(this.ID, this.type, this.displayName, this.fullName, this.cosmetic);
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
