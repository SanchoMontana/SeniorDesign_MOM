import 'package:flutter/material.dart';
import 'package:demo/custom_classes/pet.dart';

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

  @override
  Widget build(BuildContext context) {
    //wtf am I gonna allow them to customize?
  }
}
