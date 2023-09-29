import 'package:flutter/material.dart';
import 'package:read/home/index.dart';
import 'package:read/universal/dev_scaffold.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    var _homeBloc = HomeBloc();

    return Scaffold(
      body: HomeScreen(homeBloc: _homeBloc),
    );
  }
}
