import 'package:flutter/material.dart';

class SplachScreen extends StatelessWidget {
  static const routeName = '/splach';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
