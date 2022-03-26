import 'package:flutter/material.dart';

class PetImplementation extends StatelessWidget {
  const PetImplementation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: const Text("Pet Creation"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextFormField(
          decoration: const InputDecoration(
              border: UnderlineInputBorder(), labelText: 'Enter your username'),
        ),
        const SizedBox(height: 66.6),
        // ElevatedButton(onPressed: onPressed, child: child)
        const SizedBox(height: 66.6),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ]),
    );
  }
}
