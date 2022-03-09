import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:demo/themes/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class AnimatedTaskBubble extends StatefulWidget {
  String task_name;
  String time;
  String taskID;
  bool today = true;
  bool taskCompleted = false;
  AnimatedTaskBubble(
      {Key? key,
      required this.taskID,
      required this.task_name,
      required this.taskCompleted,
      required this.time,
      required this.today})
      : super(key: key);

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<AnimatedTaskBubble>
    with SingleTickerProviderStateMixin {
  final _firestore = FirebaseFirestore.instance;
  late Animation<double> drag_animation;
  late AnimationController drag_controller;
  late DocumentReference docRef;
  @override
  void initState() {
    super.initState();
    drag_controller = AnimationController(
        duration: const Duration(milliseconds: 100), vsync: this);
    drag_animation =
        CurvedAnimation(parent: drag_controller, curve: Curves.elasticOut)
          ..addListener(() {
            setState(() {
              // The state that has changed here is the animation object’s value.
            });
          });
    docRef = _firestore.collection('tasks').doc(widget.taskID);
  }

  double rightShift = 0.0;
  double farthestShift = 0.0;
  double dragDistance = 0.0;
  bool snapBack = false;
  bool temp = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: drag_controller,
        builder: (BuildContext context, _) {
          if (snapBack) {
            rightShift = farthestShift - farthestShift * drag_controller.value;
          }
          if (rightShift == 0.0 && snapBack == true) {
            snapBack = false;
            farthestShift = 0.0;
            // Not sure why this next line is required for it to work... But it works now.
            // TODO: Fix next line to be less hacky...
            drag_controller.reverse();
          }
          return Container(
              height: 60.0,
              margin: EdgeInsets.fromLTRB(20 + rightShift, 10, 20, 10),
              child: GestureDetector(
                  // While dragging, this next block is being run every time the distance dragged changes.
                  onHorizontalDragUpdate: (DragUpdateDetails details) {
                    dragDistance += details.delta.dx;
                    if (dragDistance < 0.0) {
                      dragDistance = 0.0;
                    }
                    setState(() {
                      rightShift = log(dragDistance + 1) * 12;
                    });
                  },
                  onHorizontalDragEnd: (DragEndDetails) {
                    farthestShift = rightShift;
                    snapBack = true;
                    drag_controller.forward();
                    widget.taskCompleted =
                        toggleTaskCompleted(widget.taskCompleted, rightShift);
                    dragDistance = 0;

                    docRef.update({'completed': widget.taskCompleted});
                    //TODO: get the DB to update with completed or not for the right task
                  },
                  child: Card(
                      // Color changes more green based on how far the card is shifted to the right.
                      color: widget.taskCompleted
                          ? rightShift.toInt() < 60
                              ? Color.fromARGB(
                                  255,
                                  158 - rightShift.toInt() * 2,
                                  158 - rightShift.toInt() * 2,
                                  158 - rightShift.toInt() * 2)
                              : Colors.black
                          : rightShift.toInt() < 60
                              ? Color.fromARGB(175 + rightShift.toInt(), 0,
                                  0 + rightShift.toInt() * 2, 0)
                              : const Color.fromARGB(255, 0, 150, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_right_rounded,
                            color: widget.taskCompleted
                                ? Colors.grey[700]
                                : Colors.blue.shade200,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.task_name,
                                style: TextStyle(
                                  color: widget.taskCompleted
                                      ? Colors.grey[700]
                                      : Color.fromARGB(255, 206, 206, 206),
                                  fontSize: 20,
                                  decoration: widget.taskCompleted
                                      ? TextDecoration.lineThrough
                                      : null,
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                            ],
                          ),
                          Container(
                              height: 30,
                              alignment: Alignment.center,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  color: widget.taskCompleted
                                      ? Colors.grey[700]
                                      : Colors.red,
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2, horizontal: 10),
                                      child: Text(
                                        widget.time,
                                        style: TextStyle(
                                          color: widget.taskCompleted
                                              ? Colors.white60
                                              : Colors.white,
                                          fontSize: 12,
                                          decoration: widget.taskCompleted
                                              ? TextDecoration.lineThrough
                                              : null,
                                        ),
                                      )))),
                        ],
                      ))));
        });
  }

  bool toggleTaskCompleted(bool taskCompleted, double rightShift) {
    if (rightShift >= 60) {
      return !taskCompleted;
    }
    return taskCompleted;
  }
}
