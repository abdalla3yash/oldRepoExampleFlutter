
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:read/screens/home/home_screen.dart';
import 'package:read/screens/register/register.dart';
import 'package:read/services/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {


  bool _isLoading = false;


  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ScaffoldState scaffoldState;
  _showMsg(msg) { //
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            ///////////  background///////////
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
                            /////////////  Email//////////////

                            TextField(
                              style: TextStyle(color: Color(0xFF000000)),
                              controller: mailController,
                              cursorColor: Color(0xFF9b9b9b),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.account_circle,
                                  color: Colors.grey,
                                ),
                                hintText: "Email",
                                hintStyle: TextStyle(
                                    color: Color(0xFF9b9b9b),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),

                            /////////////// password////////////////////

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
                            /////////////  LogIn Botton///////////////////
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: FlatButton(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 8, bottom: 8, left: 10, right: 10),
                                  child: Text(
                                    _isLoading? 'Loging...' : 'Login',
                                    textDirection: TextDirection.ltr,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                color: Color(0xFFFF835F),
                                disabledColor: Colors.grey,
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                    new BorderRadius.circular(20.0)),
                                onPressed: _isLoading ? null : _login,

                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    ////////////   new account///////////////
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                        child: Text(
                          'Create new Account',
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

  void _login() async{

    setState(() {
      _isLoading = true;
    });

    var data = {
      'email' : mailController.text,
      'password' : passwordController.text
    };

    var res = await CallApi().postData(data, 'login');
    var body = json.decode(res.body);
    if(body['success']){
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', body['token']);
      localStorage.setString('user', json.encode(body['user']));
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => HomeScreen()));
    }else{
      _showMsg(body['message']);
    }


    setState(() {
      _isLoading = false;
    });




  }

}



//import 'dart:convert';
//import 'package:read/screens/home/home_screen.dart';
//import 'package:read/services/api.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//
//import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//import 'package:read/components/button.dart';
//import 'package:read/components/custom_text_form_field.dart';
//import 'package:read/components/social_divider.dart';
//import 'package:read/components/social_sign.dart';
//import 'package:read/providers/auth.dart';
//import 'package:read/utils/validate.dart';
//import 'package:read/widgets/notification_text.dart';
//
//class LogIn extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      resizeToAvoidBottomInset: false,
//      body: LogInForm(),
//    );
//  }
//}
//
//class LogInForm extends StatefulWidget {
//  const LogInForm({Key key}) : super(key: key);
//
//  @override
//  LogInFormState createState() => LogInFormState();
//}
//
//class LogInFormState extends State<LogInForm> {
//  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//  String email;
//  String password;
//  String message = '';
//
//  bool _isLoading = false;
//
//
//  TextEditingController mailController = TextEditingController();
//  TextEditingController passwordController = TextEditingController();
//  ScaffoldState scaffoldState;
//  _showMsg(msg) { //
//    final snackBar = SnackBar(
//      content: Text(msg),
//      action: SnackBarAction(
//        label: 'Close',
//        onPressed: () {
//          // Some code to undo the change!
//        },
//      ),
//    );
//    Scaffold.of(context).showSnackBar(snackBar);
//  }
//  @override
//  Future<void> submit() async {
//    final form = _formKey.currentState;
//    if (form.validate()) {
//      await Provider.of<AuthProvider>(context).login(email, password);
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
//                onTap: () => Navigator.pushNamed(context, '/register'),
//                child: Image.asset(
//                  "assets/sign/signin.png",
//                  width: size.width,
//                  height: size.height * 0.1,
//                  alignment: Alignment.topRight,
//                ),
//              ),
//              SizedBox(height: size.height * 0.05),
//              Padding(
//                padding: const EdgeInsets.only(left: 30),
//                child: Row(
//                  children: <Widget>[
//                    Text(
//                      'WELCOME ',
//                      style: TextStyle(
//                        fontWeight: FontWeight.bold,
//                        fontSize: 25.0,
//                      ),
//                    ),
//                    Text(
//                      'BACK!',
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
//                  child: Text('We’ve got new surprises ready for you',
//                      style: TextStyle(
//                        fontSize: 17.0,
//                      )),
//                ),
//              ),
//
//              SizedBox(height: 20.0),
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
//              CustomTextFormField(
//                validate: (value) {
//                  password = value.trim();
//                  return Validate.requiredField(value, 'Password is required.');
//                },
//                obscureText: true,
//                hintText: 'Password',
//              ),
//              SizedBox(height: 15.0),
//              Padding(
//                padding: const EdgeInsets.all(16.0),
//                child: Button(
//                    textcolor: Colors.white,
//                    textsize: 16,
//                    height: 50,
//                    width: size.width * 0.9,
//                    text1: "Sign In",
//                    color: Color.fromRGBO(250, 166, 26, 1),
//                    onTap: submit),
//              ),
//              GestureDetector(
//                onTap: () => Navigator.pushNamed(context, '/password-reset'),
//                child: Center(
//                  child: Text(
//                    'FORGET PASSWORD?',
//                    style: TextStyle(
//                      fontSize: 13.0,
//                      fontWeight: FontWeight.bold,
//                      color: Color.fromRGBO(120, 132, 158, 1),
//                    ),
//                  ),
//                ),
//              ),
//              SizedBox(
//                height: size.height * 0.2,
//              ),
//              SocialDivider(),
//              SizedBox(
//                height: 15,
//              ),
//              SocialSign(),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//
//
//  void _login() async{
//
//    setState(() {
//      _isLoading = true;
//    });
//
//    var data = {
//      'email' : mailController.text,
//      'password' : passwordController.text
//    };
//
//    var res = await CallApi().postData(data, 'login');
//    var body = json.decode(res.body);
//    if(body['success']){
//      SharedPreferences localStorage = await SharedPreferences.getInstance();
//      localStorage.setString('token', body['token']);
//      localStorage.setString('user', json.encode(body['user']));
//      Navigator.push(
//          context,
//          new MaterialPageRoute(
//              builder: (context) => HomeScreen()));
//    }else{
//      _showMsg(body['message']);
//    }
//
//
//    setState(() {
//      _isLoading = false;
//    });
//
//
//
//
//  }
//
//
//}
