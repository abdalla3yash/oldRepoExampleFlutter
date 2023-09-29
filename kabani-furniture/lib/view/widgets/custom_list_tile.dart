import 'package:flutter/material.dart';
import 'package:lc/view/widgets/custom_text.dart';

class CustomListTile extends StatelessWidget {
  final String text, imagepath;
  final Color color;
  final Function onPressed;
  CustomListTile(
      {this.text, this.imagepath, this.onPressed, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        onPressed: onPressed,
        child: ListTile(
          title: CustomText(
            text: text,
          ),
          leading: Image.asset(imagepath),
          trailing: Icon(
            Icons.navigate_next,
            color: color,
          ),
        ),
      ),
    );
  }
}
