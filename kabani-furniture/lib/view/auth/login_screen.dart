import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lc/constant.dart';
import 'package:lc/core/view_model/auth_view_model.dart';
import 'package:lc/view/auth/register_screen.dart';
import 'package:lc/view/widgets/custom_button.dart';
import 'package:lc/view/widgets/custom_button_social.dart';
import 'package:lc/view/widgets/custom_text.dart';
import 'package:lc/view/widgets/custom_text_form_field.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Welcome,',
                      fontSize: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(RegisterScreen());
                      },
                      child: CustomText(
                          text: 'Sign Up', fontSize: 20, color: primaryColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: 'Sign in to Continue',
                  fontSize: 14,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  text: 'Email',
                  hint: 'test@gmail.com',
                  obscure: false,
                  onsaved: (value) {
                    controller.email = value;
                  },
                  validator: (value) {},
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  text: 'Password',
                  hint: '*******',
                  obscure: true,
                  onsaved: (value) {
                    controller.password = value;
                  },
                  validator: (value) {},
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: 'Forgot Password?',
                  alignment: Alignment.bottomRight,
                  fontSize: 14,
                  color: Colors.grey.shade700,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                  text: 'SIGN IN',
                  onpressed: () {
                    _formKey.currentState.save();
                    if (_formKey.currentState.validate()) {
                      controller.signInWithEmailAndPassword();
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  alignment: Alignment.center,
                  text: '-OR-',
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButtonSocial(
                  socialImage: 'assets/images/google.png',
                  onpressed: () {
                    controller.googleSignInMethod();
                  },
                  text: 'Sign In With Google',
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButtonSocial(
                  socialImage: 'assets/images/facebook.png',
                  onpressed: () {
                    controller.facebookSignInMethod();
                  },
                  text: 'Sign In With Facebook',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
