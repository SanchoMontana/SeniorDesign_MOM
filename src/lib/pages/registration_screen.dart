import 'package:demo/pages/home_page.dart';
import 'package:demo/pages/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:demo/custom_widgets/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen_nav';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

/*
  TODO: This may be far in the future but think about a email verification
  so that people must have access to that email address in order 
  to create an account with it.
*/
class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  late String email;
  late String password;
  late SharedPreferences logindata;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "Unblock'd",
                  style: TextStyle(
                    fontFamily: 'Comfortaa',
                    color: Colors.blueGrey,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    //Do something with the user input.
                    email = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    //Do something with the user input.
                    password = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
                //TODO: Fix this hero animation.
                Hero(
                  tag: 'reg_button',
                  child: RoundedButton(
                    color: Colors.indigo,
                    title: "Register",
                    onPressed: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final newFirebaseUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: password);
                        if (newFirebaseUser != null) {
                          Navigator.pushNamed(context, HomePage.id);
                        }
                      } catch (e) {
                        print(e);
                      }
                      logindata = await SharedPreferences.getInstance();

                      if (email != '' && password != '') {
                        print('Successful');
                        logindata.setBool('login', false);
                        logindata.setString('email', email);
                      }

                      setState(() {
                        showSpinner = false;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
