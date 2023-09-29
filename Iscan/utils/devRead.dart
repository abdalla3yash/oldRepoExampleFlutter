import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DevRead {
  static const String app_name = "1Read";
  static const String app_version = "Version 1.0.0";
  static const int app_version_code = 1;
  static const String app_color = "#ffd7167";
  static Color primaryAppColor = Colors.white;
  static Color secondaryAppColor = Colors.black;
  static bool isDebugMode = false;
  static const String fontfam = "SansSerif";


  static String baseUrl = "https://storage.googleapis.com/gdg-devfest";

  static checkDebug() {
    assert(() {
      // baseUrl = "http://127.0.0.1:8000/gdg-devfest/";
      // * Change with your local url if any
      baseUrl = "https://storage.googleapis.com/gdg-devfest";
      isDebugMode = true;
      return true;
    }());
  }

  static bool get checkDebugBool {
    var debug = false;
    assert(debug = true);

    return debug;
  }




  // welcome
  static const String welcomeText = "The new experience of book \n reading for readers";
  static const String startbtn = "Get Started";

  //splach
    //first Screen
  static const String ftitle = "Build Your Library";
  static const String fsubtitle = "Discover Restaurants offering the best \n fast food food near you on Foodwa";

  //second Screen
  static const String stitle= "Explore the available books";
  static const String ssubtitle = "Food delivery or pickup from local restaurants, \n Explore restaurants that deliver near you.";

  //third Screen
  static const String ttitle= "Select your next read";
  static const String tsubtitle = "Food delivery or pickup from local restaurants, \n Explore restaurants that deliver near you.";

  //Welcome Sign
  static const String welcome = "WELCOME TO";
  static const String sign_in= "SIGN IN";
  static const String sign_up= "SIGN UP";

// Forgot Password
  static const String forget_pass_subtitle= "We’re here to help";
  static const String forget_pass_btn= "Get your password";

  static const String email= "Email";
  static const String password= "Password";
  static const String continuee= "Continue";


// SIGN IN
  static const String sign_in_subtitle= 'We’ve got new surprises ready for you';

// SIGN UP
  static const String sign_up_subtitle= 'Let’s get to know you first';
  static const String sign_up_first_name= 'First Name';
  static const String sign_up_age= 'Age';
  static const String sign_up_register= 'Register';
  static const String sign_up_terms= 'I accept the Terms of Use.';
  static const String sign_up_terms2=  'By continuing, you agree to accept our \nPrivacy Policy & Terms of Service.';

  //READING INFO
  static const String reading_info_subtitle= 'What’s get you excited about reading';
  static const String reading_info_Fbtn= 'Reading Frequency';
  static const String reading_info_Sbtn= 'Favourite Book';
  static const String reading_info_Tbtn= 'Favourite Genres';

  // SOCIAL DIVIDER AND LOGIN
  static const String social_divider= "or continue with";



  //* Images
  static const String logo = "assets/logo.png";
  static const String welcome_screen = "assets/welcome-screen.png";
  static const String sign_in_img = "assets/signin.png";
  static const String facebook_logo = "assets/facebook.png";
  static const String sign_up_toast_img = "assets/register_done.png";

  //*  Texts
  static const String logoText = "The new experience of book \n reading for readers";
  static const String descText =
  '''DevFests are community-led, developer events hosted by GDG chapters around the globe focused on community building & learning about Google’s technologies. Each DevFest is inspired by and uniquely tailored to the needs of the developer community and region that hosts it.''';

  static const String loading_text = "Loading...";
  static const String try_again_text = "Try Again";
  static const String some_error_text = "Some error";
  static const String signInText = "Sign In";
  static const String signInGoogleText = "Sign in with google";
  static const String signOutText = "Sign Out";
  static const String wrongText = "Something went wrong";
  static const String confirmText = "Confirm";
  static const String supportText = "Support Needed";
  static const String featureText = "Feature Request";
  static const String moreFeatureText = "More Features coming soon.";
  static const String updateNowText =
      "Please update your app for seamless experience.";
  static const String checkNetText =
      "It seems like your internet connection is not active.";


  //* Preferences
  static SharedPreferences prefs;
  static const String loggedInPref = "loggedInPref1";
  static const String displayNamePref = "displayNamePref";
  static const String emailPref = "emailPref";
  static const String phonePref = "phonePref";
  static const String photoPref = "photoPref";
  static const String isAdminPref = "isAdminPref";
  static const String darkModePref = "darkModePref";

  //* JSON URLS
  static const String speakersAssetJson = "assets/json/speakers.json";
  static const String sessionsAssetJson = "assets/json/sessions.json";
  static const String teamsAssetJson = "assets/json/teams.json";

}