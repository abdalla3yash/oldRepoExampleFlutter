import 'package:flutter/material.dart';
import 'package:read/components/button.dart';
import 'package:read/splach/intro_screens.dart';
import 'package:read/utils/devRead.dart';

class WelcomePage extends StatelessWidget {
  static const String routeName = "/welcome";

  @override
  Widget build(BuildContext context) {
    final startBtn = Button(
      width: 180,
      height: 50,
      color: Color.fromRGBO(250, 166, 26, 1),
      text1: DevRead.startbtn,
      onTap: () => Navigator.pushNamed(context, OnBoardingPage.routeName),
      textsize: 19,
      textcolor: Colors.white,
    );

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 252, 251, 1),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: size.height * 0.1,
                ),
                Image.asset(DevRead.logo),
                SizedBox(height: size.height * 0.02),
                Text(
                  DevRead.welcomeText,
                  style: Theme.of(context).textTheme.headline6.apply(
                        color: Color.fromRGBO(61, 61, 61, 1),
                      ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: size.height * 0.02),
                startBtn,
                SizedBox(height: size.height * 0.07),
                Image.asset(
                  'assets/welcome/welcome2.png',
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                  height: size.height * 0.5,
                  width: size.width * 0.5,
                ),
              ]),
        ),
      ),
    );
  }
}
