import 'package:flutter/material.dart';

class BaseAlertDialog extends StatelessWidget {
  String _title;
  String _content;
  String _yes;
  String _no;
  Function _yesOnPressed;

  BaseAlertDialog(
      {String title,
      String content,
      Function yesOnPressed,
      String yes = "Yes",
      String no = "No"}) {
    this._title = title;
    this._content = content;
    this._yesOnPressed = yesOnPressed;
    this._yes = yes;
    this._no = no;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: new Text(this._title),
      content: new Text(this._content),
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
      actions: <Widget>[
        new FlatButton(
          child: Text(this._no),
          textColor: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        new FlatButton(
          textColor: Colors.redAccent,
          child: new Text(this._yes),
          onPressed: () {
            this._yesOnPressed();
          },
        ),
      ],
    );
  }
}
