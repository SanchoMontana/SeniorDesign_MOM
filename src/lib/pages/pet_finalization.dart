import 'package:demo/custom_classes/cosmetic.dart';
import 'package:flutter/material.dart';
import 'package:demo/custom_classes/pet.dart';
import 'task_creation.dart';

class PetFinalizationClass extends StatelessWidget {
  final Pet currentPet;
  const PetFinalizationClass({Key? key, required this.currentPet})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PetFinalization(
        currentPet: currentPet,
      ),
    );
  }
}

class PetFinalization extends StatefulWidget {
  final Pet currentPet;
  const PetFinalization({Key? key, required this.currentPet}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _PetNaming createState() => _PetNaming(currentPet);
}

class _PetNaming extends State<PetFinalization> {
  late Pet currentPet;

  _PetNaming(Pet currentPet);

  List<CosmeticType> choices = [
    CosmeticType.hat,
    CosmeticType.body,
    CosmeticType.shoes,
    CosmeticType.accessory
  ];

  CosmeticType choice = CosmeticType.accessory;

  _finalize() {
    Navigator.push(
        // TODO: push pet to database here
        context,
        MaterialPageRoute(builder: (context) => const TaskCreation()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Select which random cosmetic you'll recieve first"),
            DropdownButton(
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: choices.map((CosmeticType items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items.toString()),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (CosmeticType? newValue) {
                setState(() {
                  choice = newValue!;
                });
              },
            ),
            ElevatedButton(
                onPressed: _finalize, child: const Text('final choice!'))
          ],
        ),
      ),
    );
  }
}
