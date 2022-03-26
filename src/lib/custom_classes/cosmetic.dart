import 'package:flutter/material.dart';

enum CosmeticType { hat, body, shoes, accessory }

class Cosmetic {
  // ignore: non_constant_identifier_names
  late int ID;
  late CosmeticType type;
  late String displayName;
  late String fullName;
  // making the following image const prevents it from being overwritten when needed
  // ignore: prefer_const_constructors
  AssetImage cosmetic = AssetImage("images/cowboy_hat.png");
  Cosmetic();
  Cosmetic.build(
      this.ID, this.type, this.displayName, this.fullName, this.cosmetic);
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
