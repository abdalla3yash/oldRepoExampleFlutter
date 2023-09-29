
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:read/providers/auth.dart';
import 'package:read/providers/todo.dart';
import 'package:read/screens/home/home_screen.dart';
import 'package:read/screens/register/reading_info.dart';
import 'package:read/screens/register/register.dart';
import 'package:read/screens/sign/login.dart';
import 'package:read/screens/sign/password_reset.dart';
import 'package:read/screens/sign/welcome_sign.dart';
import 'package:read/screens/splach/on_boarding.dart';
import 'package:read/screens/splach/splach_screen.dart';


import 'package:read/views/loading.dart';
import 'package:read/views/todos.dart';
bool _isLoggedIn = false;

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MaterialApp(
        title: 'Read',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "SansSerif",
          primarySwatch: Colors.amber,
          primaryColor: Colors.white,
          disabledColor: Colors.grey,
          cardColor: Colors.white70,
          canvasColor: Colors.white,
          brightness: Brightness.light,
          appBarTheme: AppBarTheme(
            elevation: 0.0,
          ),
        ),
        initialRoute: '/',
        home: Scaffold(
          body: _isLoggedIn ? HomeScreen() :  LogIn(),
        ),
        routes: {
          '/': (context) => Router(),
          '/login': (context) => LogIn(),
          '/register': (context) => Register(),
          '/password-reset': (context) => PasswordReset(),
          '/welcome-sign': (context) => WelcomeSign(),
          '/on-boarding-screen': (context) => OnBoardingPage(),
          '/reading-info': (context) => ReadingInfo(),
        },
      ),
    ),
  );
}

class Router extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<AuthProvider>(context);

    return Consumer<AuthProvider>(
      builder: (context, user, child) {
        switch (user.status) {
          case Status.Uninitialized:
            return Splash();
          case Status.Unauthenticated:
            return Splash();
          case Status.Authenticated:
            return HomeScreen();
            );
          default:
            return LogIn();
        }
      },
    );



  }
}