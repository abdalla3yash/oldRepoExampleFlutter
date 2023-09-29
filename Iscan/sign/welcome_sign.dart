import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:read/components/button.dart';
import 'package:read/sign/sign_in.dart';
import 'package:read/sign_up/sign_up.dart';
import 'package:read/utils/devRead.dart';

class WelcomeSign extends StatefulWidget {
  static const String routeName = "/welcomeSign";

  @override
  _WelcomeSignState createState() => _WelcomeSignState();
}

class _WelcomeSignState extends State<WelcomeSign> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return new Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: size.height * 0.1,
              ),
              Text(DevRead.welcome,
                  style: TextStyle(
                    fontSize: 35.0,
                  )),
              SizedBox(
                height: size.height * 0.02,
              ),
              Image.asset(DevRead.logo),
              SizedBox(
                height: size.height * 0.1,
              ),
              Image.asset(
                DevRead.welcome_screen,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              Button(
                height: 50,
                width: size.width * 0.9,
                textsize: 16,
                textcolor: Colors.white,
                color: Color.fromRGBO(250, 166, 26, 1),
                text1: DevRead.sign_in,
                onTap: () => Navigator.pushNamed(context, LoginPage.routeName),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Button(
                height: 50,
                width: size.width * 0.9,
                textsize: 16,
                textcolor: Colors.black,
                color: Colors.white,
                text1: DevRead.sign_up,
                onTap: () => Navigator.pushNamed(context, SignUp.routeName),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
