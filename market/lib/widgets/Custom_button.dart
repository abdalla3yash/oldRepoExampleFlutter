import 'package:flutter/material.dart';
import 'package:market/constant.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onpressed;
  final Color? color;
  CustomButton({this.text, this.onpressed, this.color = deleteColor});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: TextButton(
        onPressed: onpressed!,
        child: CustomText(
          text: text!,
          color: Colors.white,
          fontSize: 14,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
