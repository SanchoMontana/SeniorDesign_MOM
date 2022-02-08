import 'package:demo/custom_widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'profile_creation_p1.dart';

class ProfileCreationIntro extends StatelessWidget {
  const ProfileCreationIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 300,
                width: 350,
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Center(
                        child: Text(
                          "[hooray pet done, whats your name]",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        width: 300,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Name',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              customTextButton("That's my name!", () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileCreationP1()));
              }, width: 340)
            ],
          ),
        ),
      ),
    );
  }
}
