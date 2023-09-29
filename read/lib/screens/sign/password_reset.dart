import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:read/components/button.dart';
import 'package:read/components/custom_text_form_field.dart';

import 'package:read/providers/auth.dart';
import 'package:read/utils/validate.dart';
import 'package:read/styles/styles.dart';
import 'package:read/widgets/styled_flat_button.dart';

class PasswordReset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PasswordResetForm(),
    );
  }
}

class PasswordResetForm extends StatefulWidget {
  const PasswordResetForm({Key key}) : super(key: key);

  @override
  PasswordResetFormState createState() => PasswordResetFormState();
}

class PasswordResetFormState extends State<PasswordResetForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email;
  String password;
  String message = '';

  Map response = new Map();

//  Future<void> submit() async {
//    final form = _formKey.currentState;
//    if (form.validate()) {
////      bool success =
////          await Provider.of<AuthProvider>(context).passwordReset(email);
//      if (success) {
//        Navigator.pushReplacementNamed(context, '/login');
//      } else {
//        setState(() {
//          message = 'An error occurred during password reset.';
//        });
//      }
//    }
//  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
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
                  child: Text("We’re here to help",
                      style: TextStyle(
                        fontSize: 17.0,
                      )),
                ),
              ),
              Text(
                message,
                textAlign: TextAlign.center,
                style: Styles.error,
              ),
              SizedBox(height: 30.0),
              CustomTextFormField(
                validate: (value) {
                  email = value.trim();
                  return Validate.validateEmail(value);
                },
                obscureText: false,
                hintText: 'Email',
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Button(
                    textcolor: Colors.white,
                    textsize: 16,
                    height: 50,
                    width: size.width * 0.9,
                    text1: 'Get Your Password',
                    color: Color.fromRGBO(250, 166, 26, 1),
   //                 onTap: submit
                 ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
