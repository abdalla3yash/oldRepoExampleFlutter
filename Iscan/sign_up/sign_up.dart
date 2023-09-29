import 'dart:async';
import 'package:flutter/material.dart';
import 'package:read/components/button.dart';
import 'package:read/components/rounded_input_field.dart';
import 'package:read/components/social_divider.dart';
import 'package:read/components/social_sign.dart';
import 'package:read/home/index.dart';
import 'package:read/sign/sign_in.dart';
import 'package:read/sign_up/sign_up_reading_info.dart';
import 'package:read/sign_up/sign_up_toast.dart';
import 'package:read/utils/devRead.dart';

bool _value = false;

class SignUp extends StatefulWidget {
  static const String routeName = "/signup";

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1970, 1),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  static void showToast({
    @required BuildContext context,
  }) {
    OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(builder: (context) => ToastWidget());
    Overlay.of(context).insert(overlayEntry);
    Timer(Duration(seconds: 2), () => overlayEntry.remove());
    Navigator.pushNamed(context, ReadingInfo.routeName);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(children: <Widget>[
            InkWell(
              onTap: () => Navigator.pushNamed(context, LoginPage.routeName),
              child: Image.asset(
                DevRead.sign_in_img,
                width: size.width,
                height: size.height * 0.1,
                alignment: Alignment.topRight,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Row(
                children: <Widget>[
                  Text(
                    'HELLO ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                  Text(
                    'THERE!',
                    style: TextStyle(
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
                child: Text(DevRead.sign_up_subtitle,
                    style: TextStyle(
                      fontSize: 17.0,
                    )),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedInputField(
              hintText: DevRead.sign_up_first_name,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            InkWell(
              onTap: () => _selectDate(context),
              child: Container(
                height: 50,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        DevRead.sign_up_age,
                        style: TextStyle(
                            color: Color.fromRGBO(119, 119, 119, 1),
                            fontSize: 14),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 14),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: Color.fromRGBO(119, 119, 119, 1),
                        size: 17,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            RoundedInputField(
              hintText: DevRead.email,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            RoundedInputField(
              hintText: DevRead.password,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: size.width * 0.06,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _value = !_value;
                    });
                  },
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: _value
                        ? Icon(
                      Icons.check,
                      size: 25.0,
                      color: Color.fromRGBO(250, 166, 40, 1),
                    )
                        : Icon(
                      Icons.radio_button_unchecked,
                      size: 0.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.05,
                ),
                Text(DevRead.sign_up_terms),
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Button(
              textcolor: Colors.white,
              textsize: 16,
              height: 50,
              width: size.width * 0.9,
              text1: DevRead.sign_up_register,
              color: Color.fromRGBO(250, 166, 26, 1),
              onTap: () => showToast(context: context),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              DevRead.sign_up_terms2,
              style: TextStyle(
                fontSize: 13,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            SocialDivider(),
            SizedBox(
              height: 10,
            ),
            SocialSign(),
          ]),
        ),
      ),
    );
  }
}
