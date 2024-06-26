import 'package:flutter/material.dart';

class DialogText extends StatelessWidget {
  final String text;
  final Color textColor;
  const DialogText(
      {super.key, required this.text, this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 0.05;
    return Text(text,
        style: TextStyle(
            color: textColor, fontSize: width, fontWeight: FontWeight.bold));
  }
}
