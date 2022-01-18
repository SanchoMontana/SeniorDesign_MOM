import 'package:flutter/material.dart';

class TaskCreation extends StatefulWidget {
  const TaskCreation({Key? key}) : super(key: key);

  @override
  _TaskCreationState createState() => _TaskCreationState();
}

class _TaskCreationState extends State<TaskCreation> {
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
                child: Card(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text("Create A Task"),
                      ),
                      const SizedBox(
                        height: 40,
                        width: 300,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Task Name',
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 125,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Colors.black87,
                              ),
                              // ignore: avoid_print
                              onPressed: () => print("days pressed poggers"),
                              child: const Text("Certain Days"),
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Colors.black87,
                            ),
                            // ignore: avoid_print
                            onPressed: () => print("times pressed poggers"),
                            child: const Text("Certain # of Times"),
                          ),
                        ],
                      ),
                    ],
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
