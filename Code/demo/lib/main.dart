import 'package:flutter/material.dart';


void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple[200],
        appBar: AppBar(
          title: const Text('Spencer Stinks!'),
          backgroundColor: Colors.red[600],
        ),
        body: const Center(
          child: Text('So does Sam! XDDDDD'),
        ),
      ),
    ),
  );
}
