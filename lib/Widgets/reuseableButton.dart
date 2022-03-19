import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  late String text;
  final VoidCallback? onpress;
  late Color? color;
  ReusableButton({required this.text, this.onpress, this.color});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpress,
      child: Text(text),
      style: ElevatedButton.styleFrom(
        primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
    );
  }
}
