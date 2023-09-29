import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:read/components/button.dart';
import 'package:read/screens/login/login.dart';
import 'package:read/screens/register/signup.dart';

class WelcomeSign extends StatefulWidget {
  @override
  _WelcomeSignState createState() => _WelcomeSignState();
}

class _WelcomeSignState extends State<WelcomeSign> {
  GlobalKey<ScaffoldState> k = GlobalKey<ScaffoldState>();

  Widget build(BuildContext ctx) {
    return Scaffold(
      body: _welcomeView(context),
    );
  }

  Widget loginButton(BuildContext originCtx) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Button(
        textcolor: Colors.white,
        textsize: 16,
        height: 50,
        width: size.width * 0.9,
        text1: "Sign In",
        color: Color.fromRGBO(250, 166, 26, 1),
        onTap: () => Navigator.of(context, rootNavigator: true).push(
          MaterialPageRoute<bool>(
            fullscreenDialog: true,
            builder: (BuildContext context) => Login(),
          ),
        ),
      ),
    );
  }

  Widget _welcomeView(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  loginButton(context),
                ],
              ),

//                Column(
//
//                ),
//                Button(
//                  height: 50,
//                  width: size.width * 0.9,
//                  textsize: 16,
//                  textcolor: Colors.white,
//                  color: Color.fromRGBO(250, 166, 26, 1),
//                  text1: "SIGN IN",
//                  onTap: () =>
//                      Navigator.of(context, rootNavigator: true).push(
//                        MaterialPageRoute<bool>(
//                          fullscreenDialog: true,
//                          builder: (BuildContext context) => Login(),
//                        ),
//                      ),
//                ),
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
                onTap: () => Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute<bool>(
                    fullscreenDialog: true,
                    builder: (BuildContext context) => SignUp(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
