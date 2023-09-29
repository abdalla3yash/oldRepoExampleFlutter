import 'package:flutter/material.dart';
import 'package:read/utils/devRead.dart';

class SocialDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 30.0, right: 20.0),
            child: Divider(
              color: Color.fromRGBO(160, 170, 182, 1),
              height: 20,
            )),
      ),
      Text(
       DevRead.social_divider,
        style: TextStyle(
          fontSize: 14,
          color: Color.fromRGBO(160, 170, 182, 1),
        ),
      ),
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 20.0, right: 30.0),
            child: Divider(
              color: Color.fromRGBO(160, 170, 182, 1),
              height: 20,
            )),
      ),
    ]);
  }
}
