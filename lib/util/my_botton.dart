import 'package:flutter/material.dart';
import 'package:mathgame/const.dart';

class MyButton extends StatelessWidget {
  final String child;

  var buttonColor = Colors.deepPurple[400];

  MyButton({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    if (child == 'C') {
      buttonColor = Colors.green;
    } else if (child == 'DEL') {
      buttonColor = Colors.red;
    } else if (child == '=') {
      buttonColor = Colors.deepPurple;
    }

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Text(
            child,
            style: whiteTextStyle,
          ),
        ),
      ),
    );
  }
}
