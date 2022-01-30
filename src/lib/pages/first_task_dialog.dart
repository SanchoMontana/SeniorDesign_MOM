import 'package:flutter/material.dart';

class FirstTaskDialog extends StatelessWidget {
  const FirstTaskDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("You're new!"),
      content: const Text(
        "It looks like you have no tasks set up, would you like to create your first one now?",
      ),
      actions: [
        TextButton(
          // ignore: avoid_print
          onPressed: () => print('no pressed'),
          child: const Text("No 😠"),
        ),
        TextButton(
          child: const Text("Yes 😇"),
          // ignore: avoid_print
          onPressed: () => print('yes pressed'),
        ),
      ],
    );
  }
}
