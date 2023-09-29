import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:read/sign/welcome_sign.dart';
import 'package:read/splach/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  static const String routeName = "/splach";
  @override
  SplashState createState() => new SplashState();
}

class SplashState extends State<Splash> with AfterLayoutMixin<Splash> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new WelcomeSign()));
    } else {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new WelcomePage()));
      await prefs.setBool('seen', true);
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(),
    );
  }
}
