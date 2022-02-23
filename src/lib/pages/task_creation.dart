import 'package:demo/custom_widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:demo/custom_widgets/number_picker.dart';
import 'package:demo/themes/constants.dart';

//TODO: try to submit a class object and get it to appear on the home page OR try to make a user settings page to update an .ini file

//TODO: put all of this in a "task" class
bool daysPressed = false;
bool timesPressed = false;
bool buildPressed = false;
bool breakPressed = false;

bool sunPressed = false;
bool monPressed = false;
bool tuesPressed = false;
bool wedPressed = false;
bool thursPressed = false;
bool friPressed = false;
bool satPressed = false;

class TaskCreation extends StatefulWidget {
  const TaskCreation({Key? key}) : super(key: key);

  @override
  _TaskCreationState createState() => _TaskCreationState();
}

class _TaskCreationState extends State<TaskCreation> {
  final _formKey = GlobalKey<FormState>();

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
                child: Form(
                  key: _formKey,
                  child: Card(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text("Create A Task"),
                        ),
                        SizedBox(
                          width: 300,
                          child: TextFormField(
                            //TODO: need to give this a text controller to actually pull the value to send to the database.
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please name your task';
                              } else {
                                return null;
                              }
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              isDense: true,
                              labelText: 'Task Name',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text("Do you want to build or break your habit?"),
                        FormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (!buildPressed && !breakPressed) {
                              return 'Please select build or break';
                            }
                          },
                          builder: (FormFieldState state) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                            state.validate();
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
                                            state.validate();
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                if (state.hasError) ...[
                                  Text(state.errorText!,
                                      style: kErrorTextStyle),
                                ]
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        const Text("How do you want to be reminded?"),
                        FormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (!daysPressed && !timesPressed) {
                              return 'Please select how you would like to be reminded';
                            }
                          },
                          builder: (FormFieldState state) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      width: 140,
                                      child: TextButton(
                                        style: daysPressed
                                            ? kTextButtonSelectedTheme
                                            : null,
                                        child: const Text("Certain Days"),
                                        onPressed: () {
                                          setState(() {
                                            daysPressed = true;
                                            timesPressed = false;
                                            state.validate();
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
                                            state.validate();
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                if (state.hasError) ...[
                                  Text(state.errorText!,
                                      style: kErrorTextStyle),
                                ],
                              ],
                            );
                          },
                        ),
                        if (daysPressed) ...[
                          DayPicker()
                        ] else if (timesPressed) ...[
                          const NumberPicker()
                        ],
                        const SizedBox(
                          height: 20,
                        ),
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
                                if (_formKey.currentState!.validate()) {
                                  //TODO: call async function to store to database :)
                                  print('form is good :o)');
                                }
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
            ),
          ],
        ),
      ),
    );
  }
}

class DayPicker extends StatefulWidget {
  DayPicker({Key? key}) : super(key: key);

  @override
  _DayPickerState createState() => _DayPickerState();
}

class _DayPickerState extends State<DayPicker> {
  @override
  Widget build(BuildContext context) {
    return FormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (!sunPressed &&
            !monPressed &&
            !tuesPressed &&
            !wedPressed &&
            !thursPressed &&
            !friPressed &&
            !satPressed) {
          return 'Please select the day(s) you want to be reminded';
        }
      },
      builder: (FormFieldState state) {
        return GestureDetector(
          onTap: () {
            state.validate();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 20),
              const Text("Select which days you want to be reminded:"),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sunPressed = !sunPressed;
                        state.validate();
                      });
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: sunPressed
                            ? kTextButtonSelectedColor
                            : kTextButtonColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Text('SU'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        monPressed = !monPressed;
                        state.validate();
                      });
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: monPressed
                            ? kTextButtonSelectedColor
                            : kTextButtonColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Text('MO'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tuesPressed = !tuesPressed;
                        state.validate();
                      });
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: tuesPressed
                            ? kTextButtonSelectedColor
                            : kTextButtonColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Text('TU'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        wedPressed = !wedPressed;
                        state.validate();
                      });
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: wedPressed
                            ? kTextButtonSelectedColor
                            : kTextButtonColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Text('WE'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        thursPressed = !thursPressed;
                        state.validate();
                      });
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: thursPressed
                            ? kTextButtonSelectedColor
                            : kTextButtonColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Text('TH'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        friPressed = !friPressed;
                        state.validate();
                      });
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: friPressed
                            ? kTextButtonSelectedColor
                            : kTextButtonColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Text('FR'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        satPressed = !satPressed;
                        state.validate();
                      });
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: satPressed
                            ? kTextButtonSelectedColor
                            : kTextButtonColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Text('SA'),
                    ),
                  ),
                ],
              ),
              if (state.hasError) ...[
                Text(state.errorText!, style: kErrorTextStyle)
              ]
            ],
          ),
        );
      },
    );
  }
}
