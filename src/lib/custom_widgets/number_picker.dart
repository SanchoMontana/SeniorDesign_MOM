import 'package:flutter/material.dart';
import 'package:demo/themes/constants.dart';

class NumberPicker extends StatefulWidget {
  const NumberPicker({Key? key}) : super(key: key);

  @override
  _NumberPickerState createState() => _NumberPickerState();
}

class _NumberPickerState extends State<NumberPicker> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  if (count > 1) {
                    count--;
                  }
                });
              },
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: kTextButtonColor,
                  shape: BoxShape.circle,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(Icons.remove, size: 25),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              count.toString(),
              style: const TextStyle(fontSize: 35),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (count < 7) {
                    count++;
                  }
                });
              },
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: kTextButtonColor,
                  shape: BoxShape.circle,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(Icons.add, size: 25),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
