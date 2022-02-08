import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:demo/pages/profile_creation_intro.dart';
import 'package:demo/pages/task_creation.dart';
import 'package:flutter/material.dart';
import 'package:demo/themes/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    theme: kDefaultTheme,
    title: 'Landing Page',
    home: const CoreRunning(),
  ));
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
                FirebaseFirestore.instance
                  .collection('testing')
                  .add({'timestamp': Timestamp.fromDate(DateTime.now())}),
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
                          builder: (context) => const ProfileCreationIntro()));
                },
                child: const Text('Control Life ;-;'))
          ],
        ),
      ),
    );
  }
}
