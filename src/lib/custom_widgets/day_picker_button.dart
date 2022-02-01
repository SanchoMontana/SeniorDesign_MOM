import 'package:flutter/material.dart';

class DayPickerButton extends StatefulWidget {
  final String btnText;

  const DayPickerButton(this.btnText, {Key? key}) : super(key: key);

  @override
  _DayPickerButtonState createState() => _DayPickerButtonState();
}

class _DayPickerButtonState extends State<DayPickerButton> {
  bool btnSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          btnSelected = !btnSelected;
        });
      },
      child: Container(
        width: 30,
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: btnSelected
              ? DefaultTheme.textButtonSelectedColor
              : DefaultTheme.textButtonColor,
          shape: BoxShape.circle,
        ),
        child: Text(widget.btnText),
      ),
    );
  }
}
