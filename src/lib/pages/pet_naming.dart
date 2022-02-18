import 'package:flutter/material.dart';
import 'package:demo/custom_classes/pet.dart';
import 'pet_finalization.dart';

class PetNamingClass extends StatelessWidget {
  final Pet currentPet;
  const PetNamingClass({Key? key, required this.currentPet}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PetNaming(
        currentPet: currentPet,
      ),
    );
  }
}

class PetNaming extends StatefulWidget {
  final Pet currentPet;
  const PetNaming({Key? key, required this.currentPet}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _PetNaming createState() => _PetNaming(currentPet);
}

class _PetNaming extends State<PetNaming> {
  late Pet currentPet;
  late String currentName;

  _PetNaming(Pet petVar);

  void _setPetName() {
    setState(() {
      currentPet.name = currentName;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PetNaming(
                    currentPet: currentPet,
                  )));
    });
  }

  @override
  initState() {
    currentPet = super.widget.currentPet;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Center(
        child: Card(
          child: Center(
              child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter a name for your new pet',
                ),
                onChanged: (value) => currentName,
              ),
              ElevatedButton(
                  onPressed: _setPetName, child: const Text('Thats thier name'))
            ],
          )),
        ),
      );
}
