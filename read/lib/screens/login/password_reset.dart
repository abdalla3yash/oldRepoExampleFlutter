import 'package:flutter/material.dart';
import 'package:read/components/button.dart';
import 'package:read/components/custom_text_form_field.dart';
import 'package:read/components/validate.dart';
import 'package:read/screens/views/dev_page.dart';

class PasswordReset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
  String email;
  final emailController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(children: <Widget>[
            SizedBox(height: size.height * 0.1),
            DevPage(
              title1: 'No PASSWORD',
              title2: 'NO WORRIES',
              subtitle: "We’re here to help",
            ),
            SizedBox(
              height: 10.0,
            ),
            CustomTextFormField(
              controller: emailController,
              obscureText: false,
              hintText: 'Email',
              validate: (value) {
                email = value.trim();
                return Validate.validateEmail(value);
              },
            ),
            SizedBox(
              height: 10.0,
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
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
