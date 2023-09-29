import 'package:flutter/material.dart';
import 'package:read/utils/devRead.dart';


class ToastWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Image.asset(
          DevRead.sign_up_toast_img,
          width: size.width * 0.5,
          height: size.height * 0.5,
        ),
      ),
    );
  }
}
