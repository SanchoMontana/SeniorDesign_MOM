import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:demo/custom_widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:demo/custom_widgets/number_picker.dart';
import 'package:demo/themes/constants.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  static String id = 'task_creation_nav';

  const TaskCreation({Key? key}) : super(key: key);

  @override
  _TaskCreationState createState() => _TaskCreationState();
}

class _TaskCreationState extends State<TaskCreation> {
  final _formKey = GlobalKey<FormState>();
  final _firestore = FirebaseFirestore.instance;
  late SharedPreferences logindata;
  late String userID;
  String reminderValue = '15 minutes';
  String? taskNameErrorText;

  final TextEditingController _recurrenceController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    checkUserID();
  }

  void checkUserID() async {
    logindata = await SharedPreferences.getInstance();
    userID = logindata.get("userID").toString();
  }

  @override
  Widget build(BuildContext context) {
    _recurrenceController.text = '1';

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
                  child: GestureDetector(
                    onTap: () =>
                        FocusScope.of(context).requestFocus(FocusNode()),
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
                                  taskNameErrorText = '';
                                  return 'Please name your task';
                                } else {
                                  taskNameErrorText = null;
                                  return null;
                                }
                              },
                              controller: _nameController,
                              decoration: InputDecoration(
                                errorText: taskNameErrorText,
                                errorBorder: kErrorBorder,
                                enabledBorder: kEnabledBorder,
                                focusedBorder: kFocusedBorder,
                                focusedErrorBorder: kFocusedErrorBorder,
                                isDense: true,
                                labelText: 'Task Name',
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                              ),
                            ),
                          ),

                          DayPicker(),
                          const SizedBox(height: 20),

                          //REMINDER NUMBER HERE
                          FormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (_recurrenceController.value.text.trim() ==
                                      '' ||
                                  _recurrenceController.value.text
                                      .trim()
                                      .isEmpty) {
                                return 'Please enter a number';
                              }
                            },
                            builder: (FormFieldState state) {
                              return Column(
                                children: [
                                  SizedBox(
                                    width: 300,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('Remind me'),
                                        SizedBox(
                                          width: 30,
                                          height: 20,
                                          child: TextFormField(
                                            onChanged: (value) =>
                                                {state.validate()},
                                            onEditingComplete: () {
                                              state.validate();
                                            },
                                            controller: _recurrenceController,
                                            style:
                                                const TextStyle(fontSize: 15),
                                            textAlign: TextAlign.center,
                                            textAlignVertical:
                                                TextAlignVertical.bottom,
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(
                                                  2),
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              errorText:
                                                  state.hasError ? '' : null,
                                              errorBorder: kErrorBorder,
                                              enabledBorder: kEnabledBorder,
                                              focusedBorder: kFocusedBorder,
                                              focusedErrorBorder:
                                                  kFocusedErrorBorder,
                                              isDense: true,
                                              contentPadding:
                                                  const EdgeInsets.fromLTRB(
                                                      1, 0, 0, 0),
                                            ),
                                          ),
                                        ),
                                        const Text('time(s) per day selected'),
                                      ],
                                    ),
                                  ),
                                  if (state.hasError) ...[
                                    Text(state.errorText!,
                                        style: kErrorTextStyle),
                                  ]
                                ],
                              );
                            },
                          ),

                          //TODO: add some sort of time picker here, make the wording so that it's the first reminder of the first day.
                          // in theory when they complete the task they would select the next time they want to be reminded
                          //REMINDER DROPDOWN HERE
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text('Remind me'),
                              DropdownButton<String>(
                                alignment: AlignmentDirectional.center,
                                icon: const Icon(
                                  Icons.arrow_drop_down_rounded,
                                  color: Colors.black54,
                                ),
                                value: reminderValue,
                                style: const TextStyle(color: Colors.black),
                                underline: Container(
                                  height: 2,
                                  color: kTextButtonColor,
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    reminderValue = newValue!;
                                  });
                                },
                                items: <String>[
                                  '15 minutes',
                                  '30 minutes',
                                  '1 hour',
                                  '2 hours'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              const Text('before this task\'s time'),
                            ],
                          ),

                          //CANCEL AND SUBMIT BUTTONS HERE
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              customTextButton(
                                'Cancel',
                                () {
                                  Navigator.pop(context);
                                },
                                width: 140,
                              ),
                              customTextButton(
                                'Submit',
                                () {
                                  String recurrence = '';
                                  if (_recurrenceController.value.text == '1') {
                                    recurrence = 'daily';
                                  } else if (_recurrenceController.value.text ==
                                      '7') {
                                    recurrence = 'weekly';
                                  } else {
                                    recurrence = 'other';
                                  }
                                  if (_formKey.currentState!.validate()) {
                                    //TODO: destory text controllers properly
                                    _firestore.collection('tasks').add({
                                      'owner': userID,
                                      'task_name': _nameController.value.text,
                                      'tod':
                                          '12:15 PM', //TODO: look into possible DateTime object or something to send here
                                      'recurrence': recurrence,
                                      'completed': false,
                                      'reminder': reminderValue,
                                      'timestamp':
                                          Timestamp.fromDate(DateTime.now()),
                                    });
                                    Navigator.pop(context);
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
