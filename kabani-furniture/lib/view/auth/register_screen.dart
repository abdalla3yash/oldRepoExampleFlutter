import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lc/constant.dart';
import 'package:lc/core/view_model/auth_view_model.dart';
import 'package:lc/view/auth/login_screen.dart';
import 'package:lc/view/widgets/custom_button.dart';
import 'package:lc/view/widgets/custom_text.dart';
import 'package:lc/view/widgets/custom_text_form_field.dart';

class RegisterScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => Get.off(LoginScreen()),
          child: Icon(
            Icons.arrow_back,
            color: primaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomText(
                text: 'Sign Up,',
                fontSize: 30,
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextFormField(
                text: 'Name',
                hint: 'Abdalla ayash',
                obscure: false,
                onsaved: (value) {
                  controller.name = value;
                },
                validator: (value) {},
              ),
              SizedBox(
                height: 10,
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
                height: 30,
              ),
              CustomButton(
                text: 'SIGN UP',
                onpressed: () {
                  _formKey.currentState.save();
                  if (_formKey.currentState.validate()) {
                    controller.createAccountWithEmailAndPassword();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
