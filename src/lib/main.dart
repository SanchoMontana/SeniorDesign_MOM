// ignore_for_file: import_of_legacy_library_into_null_safe
import 'package:firebase_core/firebase_core.dart';
import 'package:demo/pages/task_creation.dart';
import 'package:flutter/material.dart';
import 'package:demo/themes/constants.dart';
import 'package:demo/pages/home.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Unblockd());
}

class Unblockd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: kDefaultTheme,
      title: 'Landing Page',
      initialRoute: 'home',
      routes: {
        'home': (context) => Home(),
        'task_creation': (context) => TaskCreation()
      },
    );
  }
}

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
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TaskCreation())),
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
                          builder: (context) => const TaskCreation()));
                },
                child: const Text('Control Life ;-;'))
          ],
        ),
      ),
    );
  }
}
