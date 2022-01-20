import 'package:flutter/material.dart';
import 'package:demo/themes/default_theme.dart';

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
                                  ? DefaultTheme.textButtonSelectedTheme
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
                                  ? DefaultTheme.textButtonSelectedTheme
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
                              style: daysPressed
                                  ? DefaultTheme.textButtonSelectedTheme
                                  : null,
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
                                  ? DefaultTheme.textButtonSelectedTheme
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
                          ? const DaysWidget()
                          : timesPressed
                              ? const TimesWidget()
                              : Container(),
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

class DaysWidget extends StatefulWidget {
  const DaysWidget({Key? key}) : super(key: key);

  @override
  _DaysWidgetState createState() => _DaysWidgetState();
}

class _DaysWidgetState extends State<DaysWidget> {
  @override
  Widget build(BuildContext context) {
    return const Text("Dayman aaaahhhh");
  }
}

class TimesWidget extends StatefulWidget {
  const TimesWidget({Key? key}) : super(key: key);

  @override
  _TimesWidgetState createState() => _TimesWidgetState();
}

class _TimesWidgetState extends State<TimesWidget> {
  @override
  Widget build(BuildContext context) {
    return const Text("Fighter of the night man!");
  }
}
