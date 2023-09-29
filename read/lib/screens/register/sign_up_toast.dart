import 'package:flutter/material.dart';


class ToastWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/sign/register_done.png',
          width: size.width * 0.5,
          height: size.height * 0.5,
        ),
      ),
    );
  }
}
