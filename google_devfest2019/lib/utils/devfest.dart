import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Devfest {
  static const String app_name = "El-Khanka";
  static const String app_version = "Version 1.0.6";
  static const int app_version_code = 1;
  static const String app_color = "#ffd7167";
  static Color primaryAppColor = Colors.white;
  static Color secondaryAppColor = Colors.black;
  static const String google_sans_family = "GoogleSans";
  static bool isDebugMode = false;

  static const String banner_light = 'assets/images/banner_light.png';
  static const String banner_dark = 'assets/images/banner_dark.png';

  //*  Texts
  static const String welcomeText = "مرحبآ بكم في الخانكة";
  static const String descText =
      '''مركز الخانكة، مركز إداري مصري. يقع في محافظة القليوبية ضمن إقليم القاهرة الكبرى في جمهورية مصر العربية. القاعدة الإدارية للمركز هي مدينة الخانكة، وتضم كذلك مدينة الخصوص.''';

  static const String loading_text = "Loading...";
  static const String try_again_text = "عاود مجددآ";
  static const String some_error_text = "حدث خطأ";
  static const String signInText = "تسجيل الدخول";
  static const String signInGoogleText = "Sign in with google";
  static const String signOutText = "تسجيل الخروج";
  static const String wrongText = "حدث خطأ للأسف";
  static const String confirmText = "تأكيد";
  static const String supportText = "Support Needed";
  static const String featureText = "Feature Request";
  static const String moreFeatureText = "نعمل عليها في الوقت الحالى";
  static const String updateNowText =
      "Please update your app for seamless experience.";
  static const String checkNetText =
      "يبدو أن الانترنت منفصل من فضلك أعد تشغيل الانترنت";

  static const String agenda_text = "الشائع";
  static const String speaker_text = "الاطياء";
  static const String team_text = "الماركت";
  static const String sponser_text = "المطاعم";
  static const String faq_text = "الصيدليات ";
  static const String map_text = "خدمات";

  static SharedPreferences prefs;
  static const String darkModePref = 'darkModePref';
}
