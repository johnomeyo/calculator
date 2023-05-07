// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key, this.text, this.color, this.textColor, this.tapFunction});
  final text;
  final color;
  final textColor;
  final tapFunction;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapFunction,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            //borderRadius: BorderRadius.circular(10)
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
