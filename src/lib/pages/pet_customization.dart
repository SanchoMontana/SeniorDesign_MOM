import 'package:flutter/material.dart';

class PetCustomization extends StatefulWidget {
  const PetCustomization({Key? key}) : super(key: key);

  @override
  State<PetCustomization> createState() => _PetCustomizationState();
}

class _PetCustomizationState extends State<PetCustomization> {
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
          ],
        ),
      );
}
