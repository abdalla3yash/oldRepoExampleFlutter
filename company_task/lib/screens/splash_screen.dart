import 'package:animated_splash/animated_splash.dart';
import 'package:flutter/material.dart';
import 'package:mobilsharelocation/screens/home_page.dart';
import 'package:mobilsharelocation/utilities/constant.dart';


class Splash extends StatelessWidget {
  static final String id ='splash_screen';
  @override
  Widget build(BuildContext context) {
    return AnimatedSplash(
     imagePath:"assets/images/location-clipart-location-pointer-5-removebg-preview.png",
     home: HomePage(),
     duration: 3000,
     type: AnimatedSplashType.StaticDuration,
     
   );
  }
}

