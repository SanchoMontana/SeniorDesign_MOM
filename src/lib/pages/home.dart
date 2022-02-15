import 'package:demo/pages/task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo/pages/task.dart';

class Home extends StatelessWidget {

  List<Widget> today_tasks = [
    Task(
      task_name: "workout time", 
      time: "3 PM",
      today: true,
    ),
    Task(
      task_name: "Read newpaper", 
      time: "6 AM",
      today: true,
    ),
    
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Stack(
          children: <Widget>[
            Image.asset('res/lib_draft.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            ListView(
              children: today_tasks
            )
            
          ],
        )
      ),
    );
  }
}