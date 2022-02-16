import 'package:demo/custom_widgets/animated_task_bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo/custom_widgets/animated_task_bubble.dart';

class Home extends StatelessWidget {

  List<Widget> today_tasks = [
    
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
              fit: BoxFit.fitHeight,
              alignment: Alignment.topLeft,
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