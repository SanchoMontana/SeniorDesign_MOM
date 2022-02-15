import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home ({Key? key}) : super(key: key);

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
            RichText(
              text: TextSpan(
                children: [
                  
                ]
              )
            )
          ],
        )
      ),
    );
  }
}