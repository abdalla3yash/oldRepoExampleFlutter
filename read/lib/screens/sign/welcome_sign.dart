import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:read/components/button.dart';

class WelcomeSign extends StatefulWidget {
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
              Text("WELCOME TO",
                  style: TextStyle(
                    fontSize: 35.0,
                  )),
              SizedBox(
                height: size.height * 0.02,
              ),
              Image.asset("assets/logo.png"),
              SizedBox(
                height: size.height * 0.1,
              ),
              Image.asset(
                "assets/splach/welcome-screen.png",
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
                text1:"SIGN IN",
                onTap: () => Navigator.pushNamed(context, '/login'),
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
                text1: "SIGN UP",
                onTap: () => Navigator.pushNamed(context,'/register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
