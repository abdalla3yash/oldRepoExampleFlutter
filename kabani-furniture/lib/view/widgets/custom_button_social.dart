import 'package:flutter/material.dart';
import 'package:lc/view/widgets/custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  final Function onpressed;
  final String text;
  final String socialImage;

  CustomButtonSocial({this.text, this.socialImage, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.grey.shade200),
      child: FlatButton(
        onPressed: onpressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Image.asset(socialImage),
            SizedBox(
              width: 90,
            ),
            CustomText(
              text: text,
            )
          ],
        ),
      ),
    );
  }
}
