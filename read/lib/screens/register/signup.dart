import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:read/base/view.dart';
import 'package:read/base/model.dart';
import 'package:read/components/button.dart';
import 'package:read/components/custom_text_form_field.dart';
import 'package:read/components/social_divider.dart';
import 'package:read/components/social_sign.dart';
import 'package:read/components/validate.dart';
import 'package:read/screens/login/login.dart';
import 'package:read/screens/register/sign_up_reading_info.dart';
import 'package:read/screens/register/sign_up_toast.dart';
import 'package:read/screens/views/dev_page.dart';
import 'package:read/viewmodels/auth_provider.dart';
import 'package:read/viewmodels/signup.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
  final _key = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _value = false;

  DateTime selectedDate = DateTime.now();
  String email;
  String password;
  var selectedYear;
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    animationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 1500));
    animation = animationController;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<SignUpModel>(builder: (context, model, child) {
      return Scaffold(
          resizeToAvoidBottomInset: false,
          body: model.state == ViewState.Busy
              ? Center(child: CircularProgressIndicator())
              : _signupView(model, context));
    });
  }

  Widget _signupView(SignUpModel model, BuildContext ctx) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        alignment: Alignment.center,
        child: Form(
            key: _key,
            child: Column(
              children: <Widget>[
                signInButton(context),
                SizedBox(height: 8.0),
//                titleSignUp(context),
                DevPage(
                  title1: 'HELLO ',
                  title2: 'THERE!',
                  subtitle: 'Let’s get to know you first',
                ),
                SizedBox(
                  height: 10.0,
                ),
                CustomTextFormField(
                  hintText: 'Name',
                  obscureText: false,
                  controller: nameController,
                  validate: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.0),
                CustomTextFormField(
                  obscureText: false,
                  hintText: "Email Address",
                  controller: emailController,
                  validate: (value) {
                    email = value.trim();
                    return Validate.validateEmail(value);
                  },
                ),
                SizedBox(height: 10.0),
                CustomTextFormField(
                  hintText: 'Password',
                  validate: (value) {
                    password = value.trim();
                    return Validate.requiredField(
                        value, 'Password is required.');
                  },
                  controller: passwordController,
                  obscureText: true,
                ),
                SizedBox(height: 10.0),
                terms(context),
                SizedBox(
                  height: size.height * 0.02,
                ),
                signupButton(model, context),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  'By continuing, you agree to accept our \nPrivacy Policy & Terms of Service.',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                SocialDivider(),
                SizedBox(
                  height: 10,
                ),
                SocialSign(),
              ],
            )),
      ),
    );
  }

  static void showToast({
    @required BuildContext context,
  }) {
    OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(builder: (context) => ToastWidget());
    Overlay.of(context).insert(overlayEntry);
    Timer(Duration(seconds: 2), () => overlayEntry.remove());
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ReadingInfo()),
    );
  }

  Widget signInButton(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      ),
      child: Image.asset(
        "assets/sign/signin.png",
        width: size.width,
        height: size.height * 0.1,
        alignment: Alignment.topRight,
      ),
    );
  }

  Widget terms(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
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
        Text('I accept the Terms of Use.'),
      ],
    );
  }

  Widget signupButton(SignUpModel model, BuildContext originCtx) {
    Size size = MediaQuery.of(context).size;
    return Button(
      height: 50,
      width: size.width * 0.9,
      color: Color.fromRGBO(250, 166, 26, 1),
      text1: "Register",
      textsize: 12.0,
      textcolor: Colors.white,
      onTap: () async {
        if (_value ?? true) {
          if (_key.currentState.validate()) {
            String password = passwordController.text;
            String email = emailController.text;
            String name = nameController.text;
            bool success = await model
                .signUp(name, email, password)
                .timeout(Duration(seconds: 10), onTimeout: () {
              return false;
            });

            if (success) {
              var provider =
                  Provider.of<AuthProvider>(originCtx, listen: false);
              provider.setLoggedIn(model.user.name, model.user.token);
              showToast(context: context);
            }
          }
        } else {
          Fluttertoast.showToast(
              msg: "Please Accept Our Terms!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 12.0);
        }
      },
    );
  }
}
