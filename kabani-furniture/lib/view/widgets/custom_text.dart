import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize, height;
  final Color color;
  final Alignment alignment;

  CustomText(
      {this.text = '',
      this.fontSize = 16,
      this.color = Colors.black,
      this.alignment = Alignment.bottomLeft,
      this.height = 1});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize, height: height, color: color),
      ),
    );
  }
}
