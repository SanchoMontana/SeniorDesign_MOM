import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Task extends StatefulWidget {
  String task_name;
  String time;
  bool today = true;
  Task({ Key? key, required this.task_name, required this.time, required this.today}) : super(key: key);

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
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
    );
  }
}



