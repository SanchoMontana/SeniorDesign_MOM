import 'package:demo/custom_classes/task.dart';
import 'package:demo/custom_widgets/animated_task_bubble.dart';
import 'package:demo/pages/task_creation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo/custom_widgets/animated_task_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page_nav';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _firestore = FirebaseFirestore.instance;
  // This doesnt work.
  // TODO: Only allow the stream to get tasks that belong to the user. Check the email logged in by using shared Prefs.
  late SharedPreferences logindata;
  late String userID;

  @override
  void initState() {
    super.initState();
    checkUserID();
  }

  Future<String> checkUserID() async {
    logindata = await SharedPreferences.getInstance();
    userID = logindata.get("userID").toString();
    return userID;
  }

  List<Widget> todayTasks = [];
  @override
  Widget build(BuildContext context) {
    var futureBuilder = FutureBuilder(
        future: checkUserID(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Text("loading...");
            default:
              if (snapshot.hasError)
                return Text('Error: ${snapshot.error}');
              else
                return taskStream(context, snapshot);
          }
        });

    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.blueGrey,
            body: Stack(
              children: <Widget>[
                Image.asset(
                  'res/lib_draft.png',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.topLeft,
                ),
                //ListView(children: todayTasks),
                // This block of commented code creates a stream... updating from the database each time the database is changed.
                futureBuilder,
                // This Align object is just to prevent the user from dragging tasks on the bottom of the screen.
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        height: 200,
                        width: double.infinity,
                        color: Colors.transparent)),
                // This is the pet in the bottom left.
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Image.asset(
                      "res/pet.png",
                      alignment: Alignment.bottomRight,
                      height: 150,
                      width: 150,
                    )),
                // This is the add task button in the bottom right.
                Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                        width: 120,
                        height: 50,
                        margin:
                            EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                        child: TextButton(
                            onPressed: () => showDialog(
                                  barrierDismissible: false,
                                  barrierColor: const Color(0x77000000),
                                  context: context,
                                  builder: (context) {
                                    return const TaskCreation();
                                  },
                                ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.add,
                                    color: Colors.black87,
                                  ),
                                  Text("Add Task",
                                      style: TextStyle(
                                          fontFamily: "Raleway",
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87))
                                ]),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white70,
                              padding: EdgeInsets.all(0),
                              elevation: 25,
                              shape: StadiumBorder(),
                            ))))
              ],
            )));
  }

  Widget taskStream(BuildContext context, AsyncSnapshot snapshot) {
    String userID = snapshot.data;
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection('tasks')
            .where('owner', isEqualTo: userID)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final tasks = snapshot.data?.docs;
            List<AnimatedTaskBubble> taskWidgets = [];
            for (var task in tasks!) {
              final task_name = task.get("task_name"); //["task_name"];
              final tod = task.get("tod");
              // TODO: Figure out if the task is for today...
              final taskWidget = AnimatedTaskBubble(
                task_name: task_name,
                time: tod,
                today: true,
              );
              taskWidgets.add(taskWidget);
            }
            return ListView(children: taskWidgets);
          }
          return Text("No tasks"); //TODO: Spruce this up a bit.
        });
  }
}
