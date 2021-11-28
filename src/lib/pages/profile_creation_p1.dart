import 'package:flutter/material.dart';
import 'first_task_dialog.dart';

class ProfileCreationP1 extends StatelessWidget {
  const ProfileCreationP1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
/*         appBar: AppBar(
          title: const Text('Spencer Stinks!!!'),
          backgroundColor: Colors.red[600],
        ), */
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 350,
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
              SizedBox(
                height: 40,
                width: 343,
                child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.black87,
                    ),
                    // ignore: avoid_print
                    onPressed: () => showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return const FirstTaskDialog();
                          },
                        ),
                    child: const Text("Yeehaw 🤠")),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  final String bText;
  final void Function()? onPressed;

  const BottomButton({Key? key, required this.bText, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.black87,
        ),
        // ignore: avoid_print
        onPressed: onPressed,
        child: Text(bText));
  }
}
