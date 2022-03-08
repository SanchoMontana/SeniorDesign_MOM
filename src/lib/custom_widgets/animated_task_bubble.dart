import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:demo/themes/constants.dart';

class AnimatedTaskBubble extends StatefulWidget {
  String task_name;
  String time;
  bool today = true;
  bool taskCompleted = false;
  AnimatedTaskBubble(
      {Key? key,
      required this.task_name,
      required this.time,
      required this.today})
      : super(key: key);

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<AnimatedTaskBubble>
    with SingleTickerProviderStateMixin {
  late Animation<double> drag_animation;
  late AnimationController drag_controller;
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
  }

  double rightShift = 0.0;
  double farthestShift = 0.0;
  double dragDistance = 0.0;
  bool snapBack = false;
  // changed tells us if the task_completion changes states. This is so that the user can swipe less to uncomplete the task.
  bool changed = false;
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
                    temp = widget.taskCompleted;
                    widget.taskCompleted = toggleTaskCompleted(
                        widget.taskCompleted, changed, dragDistance);
                    if (temp != widget.taskCompleted) {
                      changed = true;
                    }
                    setState(() {
                      rightShift = log(dragDistance + 1) * 12;
                    });
                  },
                  onHorizontalDragEnd: (DragEndDetails) {
                    dragDistance = 0;
                    farthestShift = rightShift;
                    snapBack = true;
                    drag_controller.forward();
                    changed = false;
                  },
                  child: Card(
                      // Color changes more green based on how far the card is shifted to the right.
                      color: Color.fromARGB(80 + rightShift.toInt(), 0,
                          0 + rightShift.toInt() * 3, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_right_rounded,
                            color: Colors.blue.shade200,
                          ),
                          Text(
                            widget.task_name,
                            style: TextStyle(
                              color: Color.fromARGB(255, 206, 206, 206),
                              fontSize: 20,
                            ),
                          ),
                          Container(
                              height: 30,
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  color: Colors.red,
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 2, horizontal: 10),
                                      child: Text(
                                        widget.time,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ))))
                        ],
                      ))));
        });
  }

  bool toggleTaskCompleted(
      bool taskCompleted, bool changed, double dragDistance) {
    if (!changed && dragDistance >= 40) {
      return !taskCompleted;
    }
    if (changed && dragDistance <= 30) {
      return !taskCompleted;
    }
    return taskCompleted;
  }
}
