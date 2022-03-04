import 'package:demo/custom_classes/cosmetic.dart';
import 'package:demo/pages/pet_customization.dart';
import 'package:flutter/material.dart';
import 'package:demo/custom_classes/pet.dart';

class PetFreeCosmeticClass extends StatelessWidget {
  final Pet currentPet;
  const PetFreeCosmeticClass({Key? key, required this.currentPet})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PetCosmeticSelection(
        currentPet: currentPet,
      ),
    );
  }
}

class PetCosmeticSelection extends StatefulWidget {
  final Pet currentPet;
  const PetCosmeticSelection({Key? key, required this.currentPet})
      : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _PetNaming createState() => _PetNaming(currentPet);
}

class _PetNaming extends State<PetCosmeticSelection> {
  late Pet currentPet;

  _PetNaming(Pet currentPet);

  late String imagePath = "images/";

  List<String> choices = ["hat", "body", "shoes", "accessory"];

  String choice = "accessory";

  _finalize() {
    Cosmetic randomGift =
        Cosmetic(1, CosmeticType.accessory, "randomGift", "randomGift");
    currentPet.cosmetics = <Cosmetic>[];
    switch (choice) {
      case "hat":
        randomGift.type = CosmeticType.hat;
        currentPet.cosmetics.add(randomGift);
        break;
      case "body":
        randomGift.type = CosmeticType.body;
        currentPet.cosmetics.add(randomGift);
        break;
      case "shoes":
        randomGift.type = CosmeticType.shoes;
        currentPet.cosmetics.add(randomGift);
        break;
      case "accessory":
        currentPet.cosmetics.add(randomGift);
    }
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const PetCustomization()));
  }

  @override
  initState() {
    currentPet = super.widget.currentPet;
    switch (currentPet.type) {
      case PetType.bird:
        imagePath += "bird";
        break;
      case PetType.cat:
        imagePath += "cat";
        break;
      case PetType.dog:
        imagePath += "dog";
        break;
    }
    imagePath += ".png";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Wonderful! Now to make ' + currentPet.name + ' truly unique',
                style: TextStyle(
                    color: Colors.purple[600],
                    fontWeight: FontWeight.bold,
                    fontSize: 24)),
            Text('select a type of random reward to recieve right now',
                style: TextStyle(
                    color: Colors.purple[600],
                    fontWeight: FontWeight.bold,
                    fontSize: 24)),
            DropdownButton(
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),
              value: choice,
              // Array list of items
              items: choices.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              style: const TextStyle(fontSize: 14, color: Colors.black),
              dropdownColor: Colors.blue,
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  choice = newValue!;
                });
              },
            ),
            SizedBox(
              width: 400,
              height: 400,
              child: Image(image: AssetImage(imagePath)),
            ),
            ElevatedButton(onPressed: _finalize, child: const Text('Gimmie!'))
          ],
        ),
      ),
    );
  }
}
