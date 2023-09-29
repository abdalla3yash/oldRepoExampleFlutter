import 'package:flutter/material.dart';
import 'package:dm_development/pages/qrcode.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(61, 64, 69, 1),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 155.0,
                    child: Image.asset(
                      "assets/logo.png",
                      height: 100,
                      width: 160,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  _usernameTextField(),
                  SizedBox(
                    height: 25.0,
                  ),
                  _passwordTextField(),
                  SizedBox(
                    height: 40.0,
                  ),
                  _loginButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _usernameTextField() {
    return Container(
      child: TextField(
        textAlign: TextAlign.center,
        obscureText: false,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            icon: Icon(Icons.mail,color: Color.fromRGBO(189, 169, 114, 1)),
            hintText: 'Email',
            hintStyle: TextStyle(color: Colors.white),
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(32.0),
            ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(32.0),
          ),
        ),
      ),
    );
  }

  Widget _passwordTextField() {
    return Container(
      child: TextField(
        textAlign: TextAlign.center,
        obscureText: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          icon: Icon(Icons.security,color:Color.fromRGBO(189, 169, 114, 1)),
          hintText: 'Password',
          hintStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(32.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(32.0),
          ),
        ),
      ),
    );
  }

  Widget _loginButton() {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.white,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context)=> QrCodePage())),
        child: Text(
          "Login",
          style: TextStyle(
            color: Color.fromRGBO(61, 64, 69, 1),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
