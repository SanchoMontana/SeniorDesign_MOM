import 'package:flutter/material.dart';
import 'package:demo/themes/default_theme.dart';

class DayPickerButton extends StatefulWidget {
  final String btnText;
  bool btnSelected = false;

  DayPickerButton(this.btnText, {Key? key}) : super(key: key);

  @override
  _DayPickerButtonState createState() => _DayPickerButtonState();
}

class _DayPickerButtonState extends State<DayPickerButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.btnSelected = !widget.btnSelected;
        });
      },
      child: Container(
        width: 30,
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: widget.btnSelected
              ? DefaultTheme.textButtonSelectedColor
              : DefaultTheme.textButtonColor,
          shape: BoxShape.circle,
        ),
        child: Text(widget.btnText),
      ),
    );
  }
}
