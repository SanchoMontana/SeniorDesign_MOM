import 'package:demo/pages/profile_creation_intro.dart';
import 'package:demo/pages/task_creation.dart';
import 'package:demo/themes/default_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: DefaultTheme.defaultTheme,
    title: 'Landing Page',
    home: const CoreRunning(),
  ));
}

//testing this change ay lmao

class CoreRunning extends StatelessWidget {
  const CoreRunning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        builder: (context) => const TaskCreation()));
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
                          builder: (context) => const ProfileCreationIntro()));
                },
                child: const Text('Control Life ;-;'))
          ],
        ),
      ),
    );
  }
}
