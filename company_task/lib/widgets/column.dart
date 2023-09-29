import 'package:flutter/material.dart';

class CustomColumn extends StatelessWidget {
  final Widget content;
  final Widget button1;
  final Widget button2;
  final Widget text;

  const CustomColumn(
      {Key key, this.content, this.button1, this.button2, this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[text, content, button1, button2],
    );
  }
}
