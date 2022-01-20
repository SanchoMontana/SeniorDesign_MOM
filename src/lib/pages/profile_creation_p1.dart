import 'package:demo/custom_widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'first_task_dialog.dart';

class ProfileCreationP1 extends StatelessWidget {
  const ProfileCreationP1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 300,
                width: 350,
                child: Card(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Nice to meet you, [name]! Let's get going to the main page!",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              customTextButton(
                  "Yeehaw 🤠",
                  () => showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return const FirstTaskDialog();
                        },
                      ),
                  width: 340),
            ],
          ),
        ),
      ),
    );
  }
}
