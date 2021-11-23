import 'package:demo/pages/landing_page.dart';
import 'package:demo/pages/profile_creation_intro.dart';
import 'package:demo/pages/profile_creation_p1.dart';
import 'package:demo/pages/first_task_dialog.dart';
import 'package:flutter/material.dart';
import 'pages/pet_creation.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Landing Page',
    home: CoreRunning(),
  ));
}

class CoreRunning extends StatelessWidget {
  const CoreRunning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Create Life : o )'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileCreationIntro()));
              },
            ),
            const SizedBox(
              width: 200,
              height: 100,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FirstTaskDialog()));
                },
                child: const Text('Control Life ;-;'))
          ],
        ),
      ),
    ));
  }
}
