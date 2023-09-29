import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:read/config/config_page.dart';
import 'package:read/utils/devRead.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();


  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  //* Forcing only portrait orientation
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // * Get Shared Preference Instance for whole app
  DevRead.prefs = await SharedPreferences.getInstance();

  //* To check the app is running in debug and set some variables for that
  DevRead.checkDebug();


  runApp(ConfigPage());
}
