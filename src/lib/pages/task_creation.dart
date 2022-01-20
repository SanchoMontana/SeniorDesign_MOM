import 'package:flutter/material.dart';
import 'package:demo/custom_widgets/custom_text_button.dart';

class TaskCreation extends StatefulWidget {
  const TaskCreation({Key? key}) : super(key: key);

  @override
  _TaskCreationState createState() => _TaskCreationState();
}

class _TaskCreationState extends State<TaskCreation> {
  bool daysPressed = false;
  bool numberPressed = false;

  Color buttonSelectedColor = Colors.deepPurple[800]!;
  Color buttonNotSelectedColor = Colors.deepPurple[300]!;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 350,
            child: Center(
              child: Card(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text("Create A Task"),
                    ),
                    const SizedBox(
                      height: 40,
                      width: 300,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Task Name',
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        customTextButton("Sam Stinks :P"),
                        customTextButton("Spencer Stinks :P"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
