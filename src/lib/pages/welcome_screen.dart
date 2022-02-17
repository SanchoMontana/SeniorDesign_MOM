import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:demo/custom_widgets/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen_nav';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            // Set background image here!
            Image.asset(
              'res/lib_draft.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fitHeight,
              alignment: Alignment.topLeft,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Unblock'd",
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      color: Colors.white70,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  Hero(
                    tag: "log_button",
                    child: RoundedButton(
                      color: Colors.redAccent,
                      title: "Log in",
                      onPressed: () {
                        Navigator.pushNamed(context, LoginScreen.id);
                      },
                    ),
                  ),
                  Hero(
                    tag: "reg_button",
                    child: RoundedButton(
                      color: Colors.indigo,
                      title: "Register",
                      onPressed: () {
                        Navigator.pushNamed(context, RegistrationScreen.id);
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
