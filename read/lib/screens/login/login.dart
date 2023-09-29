import 'package:read/base/model.dart';
import 'package:read/base/view.dart';
import 'package:flutter/material.dart';
import 'package:read/components/button.dart';
import 'package:read/components/custom_text_form_field.dart';
import 'package:read/components/social_divider.dart';
import 'package:read/components/social_sign.dart';
import 'package:read/components/validate.dart';
import 'package:read/screens/login/password_reset.dart';
import 'package:read/screens/register/signup.dart';
import 'package:read/screens/views/dev_page.dart';
import 'package:read/viewmodels/auth_provider.dart';
import 'package:read/viewmodels/login.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  LoginState createState() => LoginState();
}

class LoginState extends State<Login>  with  TickerProviderStateMixin {
  final _key = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<ScaffoldState> k = GlobalKey<ScaffoldState>();
  String email;
  String password;
  String message = '';

  Widget build(BuildContext ctx) {
    return BaseView<LoginModel>(
        builder: (context, model, child) => Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            key: k,
            body: model.state == ViewState.Busy
                ? Center(child: CircularProgressIndicator())
                : _loginView(model, context)));
  }

  Widget _loginView(LoginModel model, BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Form(
          key: _key,
          child: Column(
            children: <Widget>[
              signUpButton(context),
              SizedBox(height: 8.0),
              DevPage(
                title1: 'WELCOME ',
                title2: 'BACK!',
                subtitle: 'We’ve got new surprises ready for you',
              ),
              SizedBox(height: 40.0),
              emailInput(),
              SizedBox(height: 10.0),
              passwordInput(),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  loginButton(model, context),
                ],
              ),
              SizedBox(height: 3.0),
              resetPassword(context),
              SizedBox(
                height: size.height * 0.2,
              ),
              SocialDivider(),
              SizedBox(
                height: 15,
              ),
              SocialSign(),
            ],
          )),
    );
  }

  Widget loginButton(LoginModel model, BuildContext originCtx) {
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
          onTap: () async {
            if (_key.currentState.validate()) {
              String email = emailController.text;
              String password = passwordController.text;
              bool success = await model
                  .login(email, password)
                  .timeout(Duration(seconds: 10), onTimeout: () {
                return true;
              });

              if (success) {
                var provider =
                    Provider.of<AuthProvider>(originCtx, listen: false);
                provider.setLoggedIn(model.user.name, model.user.token);
              } else {
                k.currentState.showSnackBar(
                  SnackBar(
                    content: Text("Wrong email or password",
                        style: TextStyle(color: Colors.white)),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            }
          }),
    );
  }


  Widget resetPassword(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PasswordReset()),
      ),
      child: Center(
        child: Text(
          'FORGET PASSWORD?',
          style: TextStyle(
            fontSize: 13.0,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(120, 132, 158, 1),
          ),
        ),
      ),
    );
  }

  Widget signUpButton(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignUp()),
      ),
      child: Image.asset(
        "assets/sign/signup.png",
        width: size.width,
        height: size.height * 0.1,
        alignment: Alignment.topRight,
      ),
    );
  }

  Widget emailInput() {
    return FutureBuilder(
        future: getEmailAndPassword(),
        builder: (BuildContext ctx, AsyncSnapshot s) {
          if (s.hasData) {
            if (s.data.email.length > 0) {
              emailController.text = s.data.email;
              passwordController.text = s.data.password;
            }
          } else {
            emailController.text = "";
            passwordController.text = "";
          }
          return CustomTextFormField(
            controller: emailController,
            obscureText: false,
            hintText: 'Email',
            validate: (value) {
              email = value.trim();
              return Validate.validateEmail(value);
            },
          );
        });
  }

  Widget passwordInput() {
    return CustomTextFormField(
      controller: passwordController,
      obscureText: true,
      hintText: "Password",
      validate: (value) {
        password = value.trim();
        return Validate.requiredField(value, 'Password is required.');
      },
    );
  }

  getEmailAndPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString("email") ?? "";
    String password = prefs.getString("password") ?? "";

    return EmailPassword(email, password);
  }
}

class EmailPassword {
  String email, password;
  EmailPassword(this.email, this.password);
}
