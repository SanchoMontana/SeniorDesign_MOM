// ignore_for_file: import_of_legacy_library_into_null_safe
import 'package:demo/pages/login_screen.dart';
import 'package:demo/pages/registration_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:demo/pages/task_creation.dart';
import 'package:flutter/material.dart';
import 'package:demo/themes/constants.dart';
import 'package:demo/pages/home_page.dart';
import 'package:demo/pages/welcome_screen.dart';

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
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        HomePage.id: (context) => HomePage(),
        TaskCreation.id: (context) => TaskCreation(),
      },
    );
  }
}
