import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  late String text;
  void onClick;
  ReusableButton({required this.text});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(text),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
    );
  }
}
