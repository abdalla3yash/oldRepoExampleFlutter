import 'package:ap/presentation/resources/routes_manager.dart';
import 'package:ap/presentation/resources/theme_manager.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  MyApp._internal(); // private name constructor
  int appState = 0;
  static final MyApp instance = MyApp._internal(); // single instance

  factory MyApp() => instance; //factory for the class instance
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}
