import 'package:demo/custom_widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:demo/custom_widgets/day_picker_button.dart';
import 'package:demo/themes/constants.dart';

class TaskCreation extends StatefulWidget {
  const TaskCreation({Key? key}) : super(key: key);

  @override
  _TaskCreationState createState() => _TaskCreationState();
}

class _TaskCreationState extends State<TaskCreation> {
  bool daysPressed = false;
  bool timesPressed = false;
  bool buildPressed = false;
  bool breakPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 350,
              child: Center(
                child: Card(
                  color: Colors.blueGrey[500],
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text("Create A Task"),
                      ),
                      const SizedBox(
                        height: 30,
                        width: 300,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Task Name',
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text("Do you want to build or break your habit?"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 140,
                            child: TextButton(
                              style: buildPressed
                                  ? kTextButtonSelectedTheme
                                  : null,
                              child: const Text("Build 👷‍♂️"),
                              onPressed: () {
                                setState(() {
                                  buildPressed = true;
                                  breakPressed = false;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 140,
                            child: TextButton(
                              style: breakPressed
                                  ? kTextButtonSelectedTheme
                                  : null,
                              child: const Text("Break 🔨"),
                              onPressed: () {
                                setState(() {
                                  buildPressed = false;
                                  breakPressed = true;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text("How do you want to be reminded?"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 140,
                            child: TextButton(
                              style:
                                  daysPressed ? kTextButtonSelectedTheme : null,
                              child: const Text("Certain Days"),
                              onPressed: () {
                                setState(() {
                                  daysPressed = true;
                                  timesPressed = false;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 140,
                            child: TextButton(
                              style: timesPressed
                                  ? kTextButtonSelectedTheme
                                  : null,
                              child: const Text("Certain # of Times"),
                              onPressed: () {
                                setState(() {
                                  daysPressed = false;
                                  timesPressed = true;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      daysPressed
                          ? const DayPicker()
                          : timesPressed
                              ? const NumberPicker()
                              : Container(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          customTextButton(
                            'Cancel',
                            () {
                              // ignore: avoid_print
                              print('cancelling :(');
                            },
                            width: 140,
                          ),
                          customTextButton(
                            'Submit', //TODO: turn this into a form and don't let them hit submit until enough is selected
                            () {
                              // ignore: avoid_print
                              print('submitting :D');
                            },
                            width: 140,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//for the submit button, you could see if you can just enable or disable it thru code, and just make sure that name has a value, the buttons are selected, and days or # is selected. just a giant if-condition

//daypicker widget with text as constructor parameter. define theme variable, when it's clicked call a changeBackground method that updates the theme? with onPressed and setState?

class DayPicker extends StatefulWidget {
  const DayPicker({Key? key}) : super(key: key);

  @override
  _DayPickerState createState() => _DayPickerState();
}

class _DayPickerState extends State<DayPicker> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(height: 20),
        const Text("Select which days you want to be reminded:"),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            DayPickerButton('Su'),
            DayPickerButton('Mo'),
            DayPickerButton('Tu'),
            DayPickerButton('We'),
            DayPickerButton('Th'),
            DayPickerButton('Fr'),
            DayPickerButton('Su'),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class NumberPicker extends StatefulWidget {
  const NumberPicker({Key? key}) : super(key: key);

  @override
  _NumberPickerState createState() => _NumberPickerState();
}

class _NumberPickerState extends State<NumberPicker> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  if (count > 1) {
                    count--;
                  }
                });
              },
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: kTextButtonColor,
                  shape: BoxShape.circle,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(Icons.remove, size: 25),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              count.toString(),
              style: const TextStyle(fontSize: 35),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (count < 7) {
                    count++;
                  }
                });
              },
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: kTextButtonColor,
                  shape: BoxShape.circle,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(Icons.add, size: 25),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
