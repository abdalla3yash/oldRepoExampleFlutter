
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:read/screens/home/home_screen.dart';
import 'package:read/screens/sign/login.dart';
import 'package:read/services/api.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            /////////////  background/////////////
            new Container(
              decoration: new BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 0.4, 0.9],
                  colors: [
                    Color(0xFFFF835F),
                    Color(0xFFFC663C),
                    Color(0xFFFF3F1A),
                  ],
                ),
              ),
            ),

            Positioned(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      elevation: 4.0,
                      color: Colors.white,
                      margin: EdgeInsets.only(left: 20, right: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            /////////////// name////////////

                            TextField(
                              style: TextStyle(color: Color(0xFF000000)),
                              controller: firstNameController,
                              cursorColor: Color(0xFF9b9b9b),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.account_circle,
                                  color: Colors.grey,
                                ),
                                hintText: "Firstname",
                                hintStyle: TextStyle(
                                    color: Color(0xFF9b9b9b),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                            TextField(
                              style: TextStyle(color: Color(0xFF000000)),
                              controller: lastNameController,
                              cursorColor: Color(0xFF9b9b9b),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.account_circle,
                                  color: Colors.grey,
                                ),
                                hintText: "Lastname",
                                hintStyle: TextStyle(
                                    color: Color(0xFF9b9b9b),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),

                            /////////////// Email ////////////

                            TextField(
                              style: TextStyle(color: Color(0xFF000000)),
                              controller: mailController,
                              cursorColor: Color(0xFF9b9b9b),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.mail,
                                  color: Colors.grey,
                                ),
                                hintText: "Email ",
                                hintStyle: TextStyle(
                                    color: Color(0xFF9b9b9b),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),

                            /////////////// password ////////////

                            TextField(
                              style: TextStyle(color: Color(0xFF000000)),
                              cursorColor: Color(0xFF9b9b9b),
                              controller: passwordController,
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.vpn_key,
                                  color: Colors.grey,
                                ),
                                hintText: "Password",
                                hintStyle: TextStyle(
                                    color: Color(0xFF9b9b9b),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                            TextField(
                              style: TextStyle(color: Color(0xFF000000)),
                              controller: phoneController,
                              cursorColor: Color(0xFF9b9b9b),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.mobile_screen_share,
                                  color: Colors.grey,
                                ),
                                hintText: "Phone",
                                hintStyle: TextStyle(
                                    color: Color(0xFF9b9b9b),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),

                            /////////////// SignUp Button ////////////

                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: FlatButton(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 8, bottom: 8, left: 10, right: 10),
                                    child: Text(
                                      _isLoading ? 'Creating...' : 'Create account',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  color: Colors.red,
                                  disabledColor: Colors.grey,
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                      new BorderRadius.circular(20.0)),
                                  onPressed: _isLoading ? null :  _handleLogin
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    /////////////// already have an account ////////////
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => LogIn()));
                        },
                        child: Text(
                          'Already have an Account',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  void _handleLogin() async {
    setState(() {
      _isLoading = true;
    });

    var data = {
      'firstName' : firstNameController.text,
      'lastName' : lastNameController.text,
      'email' : mailController.text,
      'password' : passwordController.text,
      'phone' : phoneController.text,
    };

    var res = await CallApi().postData(data, 'register');
    var body = json.decode(res.body);
    if(body['success']){
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', body['token']);
      localStorage.setString('user', json.encode(body['user']));

      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => HomeScreen()));
    }




    setState(() {
      _isLoading = false;
    });



  }
}



//import 'dart:async';
//import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//import 'package:read/components/custom_text_form_field.dart';
//import 'package:read/components/social_divider.dart';
//import 'package:read/components/social_sign.dart';
//
//import 'package:read/providers/auth.dart';
//import 'package:read/screens/register/register_toast.dart';
//import 'package:read/utils/validate.dart';
//import 'package:read/widgets/styled_flat_button.dart';
//
//bool _value = false;
//
//class Register extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      resizeToAvoidBottomInset: false,
//      body: RegisterForm(),
//    );
//  }
//}
//
//class RegisterForm extends StatefulWidget {
//  const RegisterForm({Key key}) : super(key: key);
//
//  @override
//  RegisterFormState createState() => RegisterFormState();
//}
//
//class RegisterFormState extends State<RegisterForm> {
//  DateTime selectedDate = DateTime.now();
//
//  Future<Null> _selectDate(BuildContext context) async {
//    final DateTime picked = await showDatePicker(
//        context: context,
//        initialDate: selectedDate,
//        firstDate: DateTime(1970, 1),
//        lastDate: DateTime.now());
//    if (picked != null && picked != selectedDate)
//      setState(() {
//        selectedDate = picked;
//      });
//  }
//
//  static void showToast({
//    @required BuildContext context,
//  }) {
//    OverlayEntry overlayEntry;
//
//    overlayEntry = OverlayEntry(builder: (context) => ToastWidget());
//    Overlay.of(context).insert(overlayEntry);
//    Timer(Duration(seconds: 2), () => overlayEntry.remove());
//    Navigator.pushNamed(context, '/reading-info');
//  }
//
//  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//  String name;
//  String email;
//  String password;
//  String passwordConfirm;
//  String message = '';
//
//  Map response = new Map();
//
//  Future<void> submit() async {
//    final form = _formKey.currentState;
//    if (form.validate()) {
////      response = await Provider.of<AuthProvider>(context)
////          .register(name, email, password, passwordConfirm);
//      if (response['success']) {
//        Navigator.pop(context);
//      } else {
//        setState(() {
//          message = response['message'];
//        });
//      }
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    Size size = MediaQuery.of(context).size;
//    return Form(
//      key: _formKey,
//      child: SingleChildScrollView(
//        child: Container(
//          alignment: Alignment.center,
//          child: Column(
//            children: <Widget>[
//              InkWell(
//                onTap: () => Navigator.pushNamed(context, '/login'),
//                child: Image.asset(
//                  "assets/sign/signin.png",
//                  width: size.width,
//                  height: size.height * 0.1,
//                  alignment: Alignment.topRight,
//                ),
//              ),
//              Padding(
//                padding: const EdgeInsets.only(left: 30),
//                child: Row(
//                  children: <Widget>[
//                    Text(
//                      'HELLO ',
//                      style: TextStyle(
//                        fontWeight: FontWeight.bold,
//                        fontSize: 25.0,
//                      ),
//                    ),
//                    Text(
//                      'THERE!',
//                      style: TextStyle(
//                        fontSize: 25.0,
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//              Container(
//                alignment: Alignment.centerLeft,
//                child: Padding(
//                  padding: EdgeInsets.only(left: 30),
//                  child: Text('Let’s get to know you first',
//                      style: TextStyle(
//                        fontSize: 17.0,
//                      )),
//                ),
//              ),
//              SizedBox(height: 20.0),
//              CustomTextFormField(
//                validate: (value) {
//                  name = value.trim();
//                  return Validate.requiredField(value, 'Name is required.');
//                },
//                obscureText: false,
//                hintText: 'First Name',
//              ),
//              SizedBox(
//                height: 5,
//              ),
//              Container(
//                margin: EdgeInsets.symmetric(vertical: 10),
//                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
//                height: 50,
//                width: size.width * 0.9,
//                decoration: BoxDecoration(
//                    color: Colors.white,
//                    boxShadow: [
//                      BoxShadow(
//                        color: Colors.grey.withOpacity(0.2),
//                        spreadRadius: 1,
//                        blurRadius: 7,
//                        offset: Offset(0, 3),
//                      ),
//                    ],
//                    borderRadius: BorderRadius.circular(30.0)),
//                child: Center(
//                  child: TextFormField(
//                    readOnly: true,
//                    onTap: () => _selectDate(context),
//                    decoration: InputDecoration(
//                        border: InputBorder.none,
//                        hintText:  'Age',
//                        focusedBorder: OutlineInputBorder(
//                          borderSide: BorderSide(color: Colors.white, width: 1),
//                          borderRadius: BorderRadius.circular(30.0),
//                        )),
//
//                  ),
//                ),
//              ),
//              SizedBox(height: 5.0),
//              CustomTextFormField(
//                validate: (value) {
//                  email = value.trim();
//                  return Validate.validateEmail(value);
//                },
//                obscureText: false,
//                hintText: 'email',
//              ),
//              SizedBox(
//                height: 5,
//              ),
//
//              CustomTextFormField(
//                validate: (value) {
//                  password = value.trim();
//                  return Validate.requiredField(value, 'Password is required.');
//                },
//                obscureText: true,
//                hintText: 'Password',
//              ),
//              SizedBox(
//                height: size.height * 0.02,
//              ),
//              Row(
//                children: <Widget>[
//                  SizedBox(
//                    width: size.width * 0.06,
//                  ),
//                  InkWell(
//                    onTap: () {
//                      setState(() {
//                        _value = !_value;
//                      });
//                    },
//                    child: Container(
//                      width: 25,
//                      height: 25,
//                      decoration: BoxDecoration(
//                        shape: BoxShape.circle,
//                        color: Colors.white,
//                        boxShadow: [
//                          BoxShadow(
//                            color: Colors.grey.withOpacity(0.2),
//                            spreadRadius: 1,
//                            blurRadius: 7,
//                            offset: Offset(0, 3), // changes position of shadow
//                          ),
//                        ],
//                      ),
//                      child: _value
//                          ? Icon(
//                              Icons.check,
//                              size: 25.0,
//                              color: Color.fromRGBO(250, 166, 40, 1),
//                            )
//                          : Icon(
//                              Icons.radio_button_unchecked,
//                              size: 0.0,
//                              color: Colors.white,
//                            ),
//                    ),
//                  ),
//                  SizedBox(
//                    width: size.width * 0.05,
//                  ),
//                  Text('I accept the Terms of Use.'),
//                ],
//              ),
//              SizedBox(
//                height: size.height * 0.02,
//              ),
//              StyledFlatButton(
//
//                'Register',
//                onPressed: submit,
//                height: 50,
//                width: size.width *0.9,
//              ),
//              SizedBox(
//                height: size.height * 0.02,
//              ),
//              Text(
//                'By continuing, you agree to accept our \nPrivacy Policy & Terms of Service.',
//                style: TextStyle(
//                  fontSize: 13,
//                ),
//                textAlign: TextAlign.center,
//              ),
//              SizedBox(
//                height: size.height * 0.03,
//              ),
//              SocialDivider(),
//              SizedBox(
//                height: 10,
//              ),
//              SocialSign(),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}