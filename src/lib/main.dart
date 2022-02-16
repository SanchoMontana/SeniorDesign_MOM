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
