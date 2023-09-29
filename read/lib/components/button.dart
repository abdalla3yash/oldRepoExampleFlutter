import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color color;
  final String text1;
  final Function onTap;
  final Color textcolor;
  final double textsize;
  final double width;
  final double height;

  const Button(
      {Key key,
      this.color,
      this.text1,
      this.onTap,
      this.textcolor,
      this.textsize,
      this.width,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: RaisedButton(
          onPressed: () {
            this.onTap();
          },
          color: color,
          child: Text(
            text1,
            style: TextStyle(
              color: textcolor,
              fontSize: textsize,
            ),
          ),
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
              side: BorderSide(
                color: Color.fromRGBO(250, 166, 26, 1),
              ))),
    );
  }
}
