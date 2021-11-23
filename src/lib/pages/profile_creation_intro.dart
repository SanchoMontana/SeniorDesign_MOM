import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:yaml/yaml.dart';
import 'package:flutter/services.dart' as s;

class ProfileCreationIntro extends StatelessWidget {
  ProfileCreationIntro({Key? key}) : super(key: key);

  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
/*         appBar: AppBar(
          title: const Text('Spencer Stinks!!!'),
          backgroundColor: Colors.red[600],
        ), */
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 350,
                width: 350,
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Center(
                        child: Text(
                          "[hooray pet done, whats your name]",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        width: 300,
                        child: TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Name',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 40,
                width: 343,
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.black87,
                  ),
                  child: const Text("That's my name!"),
                  //TODO: figure out how to write to a yaml and save the name in the text field, currently this doesn't work
                  //not sure what else to do, since this yaml thing was a package so i dont think reading/writing is supported by default
                  onPressed: () async {
                    //String newName = nameController.text;
                    var file = await s.rootBundle.loadString('test.yaml');
                    var doc = loadYaml(file);
                    //write to yaml file here if we can figure it out
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
