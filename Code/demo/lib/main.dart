import 'package:flutter/material.dart';
import 'pages.dart';

void main() {
  runApp(CoreRunning());
}

class CoreRunning extends AppCore {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple[200],
        appBar: AppBar(
          title: const Text('Spencer Stinks!!!'),
          backgroundColor: Colors.red[600],
        ),
        body: const Center(
          child: Text('So does Sam! XDDDDD'),
        ),
      ),
    );
  }
}
