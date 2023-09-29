import 'package:flutter/material.dart';
import 'package:read/components/button.dart';
import 'file:///C:/work/project/read/lib/screens/splach/on_boarding.dart';

class welcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final startBtn = Button(
      width: 180,
      height: 50,
      color: Color.fromRGBO(250, 166, 26, 1),
      text1: "Get Started",
      onTap: () => Navigator.of(context).pushReplacement(
        new MaterialPageRoute(builder: (context) => new OnBoardingPage()),
      ),
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
                Image.asset("assets/logo.png"),
                SizedBox(height: size.height * 0.02),
                Text(
                  "The new experience of book \n reading for readers",
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
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.fitHeight,
                  height: size.height * 0.5,
                  width: size.width * 0.4,
                ),
              ]),
        ),
      ),
    );
  }
}
