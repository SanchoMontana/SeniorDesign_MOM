import 'package:flutter/material.dart';
import 'pet_type_selection.dart';

class PetIntro extends StatefulWidget {
  static const String id = 'pet_intro_nav';
  const PetIntro({Key? key}) : super(key: key);

  @override
  State<PetIntro> createState() => _PetIntroState();
}

class _PetIntroState extends State<PetIntro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
          Text('Welcome To Unblockd',
              style: TextStyle(
                  color: Colors.purple[600],
                  fontWeight: FontWeight.bold,
                  fontSize: 40)),
          const SizedBox(
            height: 25,
          ),
          Text('An App designed to help you be you',
              style: TextStyle(
                  color: Colors.purple[600],
                  fontWeight: FontWeight.bold,
                  fontSize: 24)),
          const SizedBox(
            height: 25,
          ),
          Text('Before you commit to anything though, lets make a new  friend',
              style: TextStyle(
                  color: Colors.purple[600],
                  fontWeight: FontWeight.normal,
                  fontSize: 18)),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PetTypeSelection()));
              },
              child: const Text('Great, lets get started!'))
        ])));
  }
}
