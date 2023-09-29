import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:erpos/view/auth/intro_screen.dart';
import 'package:erpos/data/api/deb.dart' as dep;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'view/splash/splash_screen.dart';

String? jwt;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  jwt = await prefs.getString("token");
  await dep.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'),
      ],
      locale: const Locale('ar', 'AE'),
      title: 'Erpos',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: jwt == null ? const IntroScreen() : const SplashScreen(),
    );
  }
}
