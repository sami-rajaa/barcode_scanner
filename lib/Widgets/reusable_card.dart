import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  late String text;
  late Color textcolour;
  late Color buttonColour;

  ReuseableCard(
      {required this.textcolour,
      required this.text,
      required this.buttonColour});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: textcolour, fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
      ),
      height: 80,
      width: 50,
      decoration: BoxDecoration(
        color: buttonColour,
        borderRadius: BorderRadius.circular(7.0),
      ),
    );
  }
}
