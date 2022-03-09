import 'package:demo/custom_classes/cosmetic.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: non_constant_identifier_names
SizedBox Accessorizer() {
  // will need to be fed from firebase
  SharedPreferences? prefs;

  void setCosmetic(Cosmetic selected) async {
    prefs = await SharedPreferences.getInstance();
    prefs?.setString(selected.type.toString(), selected.displayName);
  }

  List<Cosmetic> allCosmetics = [
    Cosmetic(1, CosmeticType.hat, "cboy", "Cowboy Hat",
        const AssetImage("images/cboy.jpg")),
    Cosmetic(2, CosmeticType.body, "tux", "Tuxedo",
        const AssetImage("images/tux.png")),
    Cosmetic(3, CosmeticType.shoes, "sandals", "Sandals",
        const AssetImage("images/sandals.jpg")),
    Cosmetic(4, CosmeticType.accessory, "bong", "Bong",
        const AssetImage("images/bong.jpg"))
  ];

  List<Widget> selectable = [
    SizedBox(
        width: 200,
        height: 200,
        child: InkWell(
            onTap: () {
              setCosmetic(allCosmetics[0]);
            },
            child: Image(image: allCosmetics[0].cosmetic))),
    SizedBox(
        width: 200,
        height: 200,
        child: InkWell(
            onTap: () {
              setCosmetic(allCosmetics[0]);
            },
            child: Image(image: allCosmetics[1].cosmetic))),
    SizedBox(
        width: 200,
        height: 200,
        child: InkWell(
            onTap: () {
              setCosmetic(allCosmetics[0]);
            },
            child: Image(image: allCosmetics[2].cosmetic))),
    SizedBox(
        width: 200,
        height: 200,
        child: InkWell(
            onTap: () {
              setCosmetic(allCosmetics[0]);
            },
            child: Image(image: allCosmetics[3].cosmetic))),
  ];

  return SizedBox(
    width: 200,
    height: 500,
    child: Column(children: [
      Text(
        "Cosmetics",
        style: TextStyle(
            color: Colors.purple[600],
            fontWeight: FontWeight.w700,
            fontSize: 20),
      ),
      SizedBox(
        width: 400,
        height: 400,
        child: CustomScrollView(slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(selectable),
          )
        ]),
      )
    ]),
  );
}
