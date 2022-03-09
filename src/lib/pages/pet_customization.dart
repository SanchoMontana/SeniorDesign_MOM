import 'package:demo/custom_widgets/accessorizer.dart';
import 'package:demo/custom_widgets/pet_widget.dart';
import 'package:flutter/material.dart';

import '../custom_classes/pet.dart';

class PetCustomization extends StatefulWidget {
  final Pet currentPet;
  const PetCustomization({Key? key, required this.currentPet})
      : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<PetCustomization> createState() => _PetCustomizationState(currentPet);
}

class _PetCustomizationState extends State<PetCustomization> {
  late Pet currentPet;

  @override
  initState() {
    currentPet = super.widget.currentPet;
    super.initState();
  }

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
                Expanded(child: PetWidget(currentPet)),
                Expanded(
                  child: Accessorizer(),
                )
              ],
            ),
          ],
        ),
      );
}
