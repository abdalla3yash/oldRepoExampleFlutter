import 'package:flutter/material.dart';

import 'package:read/styles/styles.dart';

class StyledFlatButton extends StatelessWidget {
  final String text;
  final onPressed;
  final double radius;
  final double width;
  final double height;

  const StyledFlatButton(this.text, {this.onPressed, Key key, this.radius, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: this.height,
        width: this.width,
        child:FlatButton(
      color: Color.fromRGBO(250, 166, 26, 1),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 18.0),
        child: Text(
          this.text,
          style: Styles.p.copyWith(
            color: Colors.white,
            height: 1,
          ),
        ),
      ),
      onPressed: () {
        this.onPressed();
      },
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
            side: BorderSide(
              color: Color.fromRGBO(250, 166, 26, 1),
            )),),
    );
  }
}