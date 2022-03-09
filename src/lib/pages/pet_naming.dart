import 'package:flutter/material.dart';
import 'package:demo/custom_classes/pet.dart';
import 'pet_free_cosmetic.dart';

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
  late String currentName = "";
  late String imagePath = "images/";

  _PetNaming(Pet petVar);

  void _setPetName() {
    setState(() {
      currentPet.name = currentName;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PetCosmeticSelection(
                    currentPet: currentPet,
                  )));
    });
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
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Great Choice! Now what should we call them?',
                  style: TextStyle(
                      color: Colors.purple[600],
                      fontWeight: FontWeight.bold,
                      fontSize: 24)),
              SizedBox(
                width: 400,
                child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'name',
                    ),
                    onChanged: (value) {
                      currentName = value;
                    }),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 400,
                height: 400,
                child: Image(image: AssetImage(imagePath)),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: _setPetName, child: const Text('Thats thier name'))
            ],
          )),
        ),
      );
}
