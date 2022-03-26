import 'package:demo/custom_widgets/pet_widget.dart';
import 'package:demo/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../custom_classes/cosmetic.dart';
import '../custom_classes/pet.dart';

class PetCustomization extends StatefulWidget {
  final Pet currentPet;
  const PetCustomization({Key? key, required this.currentPet})
      : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<PetCustomization> createState() => _PetCustomizationState(currentPet);
}

// will need to be fed from firebase
SharedPreferences? prefs;

void setCosmetic(Cosmetic selected) async {
  prefs = await SharedPreferences.getInstance();
  prefs?.setString(selected.type.toString(), selected.displayName);
}

List<Cosmetic> allCosmetics = [
  Cosmetic.build(2, CosmeticType.hat, "cowboy_hat", "Cowboy Hat",
      const AssetImage("images/cowboy_hat.png")),
];

class _PetCustomizationState extends State<PetCustomization> {
  late Pet currentPet;

  @override
  initState() {
    currentPet = super.widget.currentPet;
    updatePet();
    super.initState();
  }

  void updatePet() async {
    currentPet.head = Cosmetic();
    currentPet.body = Cosmetic();
    currentPet.shoes = Cosmetic();
    currentPet.accessory = Cosmetic();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString(allCosmetics[0].type.toString()) != null) {
      currentPet.body = Cosmetic();
      currentPet.body = allCosmetics[0];
    }
  }

  void sendToMainScreen() {
    // TODO: Need to make this nav to main screen
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  List<Widget> selectable = [
    SizedBox(
        width: 200,
        height: 200,
        child: InkWell(
            onTap: () {
              setCosmetic(allCosmetics[0]);
            },
            child: Image(image: allCosmetics[0].cosmetic))),
  ];

  _PetCustomizationState(Pet currentPet);
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Customization Time',
                style: TextStyle(
                    color: Colors.purple[600],
                    fontWeight: FontWeight.bold,
                    fontSize: 24)),
            Row(
              children: [
                Expanded(
                    child: SizedBox(
                        width: 200,
                        height: 400,
                        child: Stack(
                          children: [
                            Positioned(
                                child: SizedBox(
                              width: 400,
                              height: 400,
                              child: Image(image: currentPet.pet),
                            )),
                            Positioned(
                                top: 75,
                                left: 82,
                                child: SizedBox(
                                  width: 75,
                                  height: 50,
                                  child: Image(image: currentPet.head.cosmetic),
                                ))
                          ],
                        ))),
                Expanded(
                  child: SizedBox(
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
                      ),
                      ElevatedButton(
                          onPressed: () =>
                              {Navigator.pushNamed(context, HomePage.id)},
                          child: const Text('Save'))
                    ]),
                  ),
                )
              ],
            ),
          ],
        ),
      );
}
