import 'package:flutter/material.dart';
import 'package:read/utils/devRead.dart';

class SocialSign extends StatelessWidget {
  final Function ontap;

  const SocialSign({Key key, this.ontap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 80,
        height: 50,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            DevRead.facebook_logo,
            alignment: Alignment.center,
            fit: BoxFit.scaleDown,
            height: 15,
            width: 15,
          ),
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromRGBO(160, 170, 182, 0.4)),
          borderRadius: new BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
