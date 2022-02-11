import 'package:flutter/material.dart';

class PetNamingClass extends StatelessWidget {
  const PetNamingClass({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PetNaming(),
    );
  }
}

class PetNaming extends StatefulWidget {
  const PetNaming({Key? key}) : super(key: key);

  @override
  _PetNaming createState() => _PetNaming();
}

class _PetNaming extends State<PetNaming> {
  @override
  Widget build(BuildContext context) => const Center(
        child: Card(
          child: Center(
            child: Text('Name entry or whatever'),
          ),
        ),
      );
}
