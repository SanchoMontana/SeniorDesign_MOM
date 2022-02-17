import 'package:demo/custom_widgets/animated_task_bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo/custom_widgets/animated_task_bubble.dart';

class HomePage extends StatelessWidget {

  static String id = 'home_page_nav';

  List<Widget> todayTasks = [
    
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
              children: todayTasks
            )
            
          ],
        )
      ),
    );
  }
}