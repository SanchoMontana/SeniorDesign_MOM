import 'package:demo/pages/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';

class SplashLoadingScreen extends StatefulWidget {
  static String id = 'splash_loading_screen_nav';

  @override
  _SplashLoadingScreenState createState() => _SplashLoadingScreenState();
}

class _SplashLoadingScreenState extends State<SplashLoadingScreen> {
  late SharedPreferences logindata;
  late bool newuser = true;

  @override
  void initState() {
    super.initState();
    checkUserIsLogged();
  }

  /*
    TODO: Figure out why there is a couple frame of a green background
    before the Navigator takes the user somewhere. Try to build the Scaffold 
    THEN run checkUserIsLogged().
  */
  void checkUserIsLogged() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    if (newuser == false) {
      Navigator.popAndPushNamed(context, HomePage.id);
    } else {
      Navigator.popAndPushNamed(context, WelcomeScreen.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        'res/lib_draft.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fitHeight,
        alignment: Alignment.topLeft,
      ),
    );
  }
}
