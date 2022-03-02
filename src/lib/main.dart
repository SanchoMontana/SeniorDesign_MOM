// ignore_for_file: import_of_legacy_library_into_null_safe
import 'package:demo/pages/login_screen.dart';
import 'package:demo/pages/registration_screen.dart';
import 'package:demo/pages/splash_loading_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:demo/pages/task_creation.dart';
import 'package:flutter/material.dart';
import 'package:demo/themes/constants.dart';
import 'package:demo/pages/home_page.dart';
import 'package:demo/pages/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  /*
    Uncomment the next two lines to clear cache of stored login information. 
    You will be directed to the welcome page. 
    If the next two lines is commented, the app will store login infomration 
    and the user will immediately be directed to the apps home page.
    (Only should be uncommented for testing purposes)
  */
  //SharedPreferences logindata = await SharedPreferences.getInstance();
  //await logindata.clear();

  runApp(Unblockd());
}

class Unblockd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: kDefaultTheme,
      title: 'Landing Page',
      initialRoute: SplashLoadingScreen.id,
      routes: {
        SplashLoadingScreen.id: (context) => SplashLoadingScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        HomePage.id: (context) => HomePage(),
        TaskCreation.id: (context) => TaskCreation(),
      },
    );
  }
}
