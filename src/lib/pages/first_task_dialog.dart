import 'package:flutter/material.dart';

class FirstTaskDialog extends StatelessWidget {
  const FirstTaskDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      body: SafeArea(
        child: Center(
          child: AlertDialog(
            title: const Text("You're new!"),
            content: const Text(
                "It looks like you have no tasks set up, would you like to create your first one now?"),
            actions: [
              TextButton(
                onPressed: () => print('no pressed'),
                child: Text("No 😠"),
              ),
              TextButton(
                onPressed: () => print('yes pressed'),
                child: Text("Yes 😇"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
