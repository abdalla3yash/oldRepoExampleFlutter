import 'package:flutter/material.dart';
import 'package:read/components/rounded_input_field.dart';

class DevPage extends StatelessWidget {
  final String title1, title2, subtitle;
  const DevPage({
    Key key,
    this.title1,
    this.title2,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            children: <Widget>[
              Text(
                this.title1,
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
              Text(
                this.title2,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text(this.subtitle,
                style: TextStyle(
                  fontSize: 17.0,
                )),
          ),
        ),
      ],
    );
  }
}
