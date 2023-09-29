import 'package:flutter/material.dart';
import 'package:lc/constant.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onpressed;
  final Color color;
  CustomButton({this.text, this.onpressed, this.color = primaryColor});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onpressed,
      padding: EdgeInsets.all(18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: CustomText(
        text: text,
        color: Colors.white,
        fontSize: 14,
        alignment: Alignment.center,
      ),
      color: color,
    );
  }
}
