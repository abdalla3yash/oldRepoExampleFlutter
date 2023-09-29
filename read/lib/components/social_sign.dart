import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'package:read/models/user.dart';
import 'file:///C:/work/project/read/lib/screens/home/home.dart';
import 'package:read/services/authentication_service.dart';

import '../locator.dart';

class SocialSign extends StatefulWidget {
  @override
  _SocialSignState createState() => _SocialSignState();

}

class _SocialSignState extends State<SocialSign> {

  FacebookLogin fbLogin = new FacebookLogin();
  bool isLoggedIn = false;
  bool isLoading = false;
  var profileData;
  final AuthenticationService _authService = locator<AuthenticationService>();

  User get user => _authService.user;

  var facebookLogin = FacebookLogin();

  void onLoginStatusChanged(bool isLoggedIn, {profileData}) {
    setState(() async {
      isLoading = false;
      this.isLoggedIn = isLoggedIn;
      this.profileData = profileData;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    });
  }

  void initiateFacebookLogin() async {
    setState(() {
      isLoading = true;
    });
    var facebookLoginResult = await facebookLogin.logIn(['email']);

    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.cancelledByUser:
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.loggedIn:
        var graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture.height(200)&access_token=${facebookLoginResult.accessToken.token}');
        var profile = json.decode(graphResponse.body);
        print(profile.toString());
        onLoginStatusChanged(true, profileData: profile);
        break;
    }
  }


  logout() async {
    await facebookLogin.logOut();
    onLoginStatusChanged(false);
    print("Logged out");
  }



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: initiateFacebookLogin,
      child: Container(
        width: 80,
        height: 50,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            "assets/sign/facebook.png",
            alignment: Alignment.center,
            fit: BoxFit.scaleDown,
            height: 15,
            width: 15,
          ),
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromRGBO(160, 170, 182, 0.4)),
          borderRadius: new BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
