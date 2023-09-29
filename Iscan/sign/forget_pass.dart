import 'package:flutter/material.dart';
import 'package:read/components/button.dart';
import 'package:read/components/rounded_input_field.dart';
import 'package:read/utils/devRead.dart';

class ForgetPassword extends StatefulWidget {
  static const String routeName = "/forgetpassword";

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(children: <Widget>[
            SizedBox(height: size.height * 0.1),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: <Widget>[
                  Text(
                    'No PASSWORD ',
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                  Text(
                    'NO WORRIES',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text(DevRead.forget_pass_subtitle,
                    style: TextStyle(
                      fontSize: 17.0,
                    )),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            RoundedInputField(
              hintText: DevRead.email,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Button(
              text1: DevRead.forget_pass_btn,
              height: 60,
              width: size.width * 0.9,
              color: Color.fromRGBO(250, 166, 26, 1),
              textcolor: Colors.white,
              textsize: 16,
              onTap: () {},
            ),
          ]),
        ),
      ),
    );
  }
}
