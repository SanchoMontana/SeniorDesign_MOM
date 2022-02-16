import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';


class Task extends StatefulWidget {
  String task_name;
  String time;
  bool today = true;
  Task({ Key? key, required this.task_name, required this.time, required this.today}) : super(key: key);

  @override
  _TaskState createState() => _TaskState();
}
class _TaskState extends State<Task> with SingleTickerProviderStateMixin{
  late Animation<double> animation;
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 100), vsync: this);
    // animation = Tween<double>(begin: 0, end: 300).animate(controller)
    animation = CurvedAnimation(parent: controller, curve: Curves.elasticOut)
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

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: controller, 
      builder: (BuildContext context, _) {
        if(snapBack) {
          rightShift = farthestShift - farthestShift * controller.value; 
        }
        if(rightShift == 0.0 && snapBack == true) {
          snapBack = false;
          farthestShift = 0.0;
          // Not sure why this next line is required for it to work... But it works now.
          // TODO: Fix next line to be less hacky...
          controller.reverse();
        }
        return Container(
          height: 60.0,
          margin: EdgeInsets.fromLTRB(20 + rightShift, 10, 20, 10),
          child: GestureDetector(
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
              dragDistance = 0;
              farthestShift = rightShift;
              snapBack = true;
              controller.forward();
            },
            child: Card(
              color:Color.fromARGB(80, 0, 0, 0),
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
                      color: Colors.blue.shade200,
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    height: 30,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(
                      horizontal: 10
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Colors.red,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 10
                        ),
                        child: Text(
                          widget.time,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        )
                      )
                    )
                  )
                ],
              )
            )
          )
        );
      }
    );
  }
}
