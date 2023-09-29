import 'package:flutter/material.dart';
import 'package:use/home/bloc/home_bloc.dart';
import 'package:use/home/home_screen.dart';
import 'package:use/universal/dev_scaffold.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    var _homeBloc = HomeBloc();
    return DevScaffold(
      title: "الصفحة الرئيسيه",
      body: HomeScreen(
        homeBloc: _homeBloc,
      ),
    );
  }
}
