import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read/config/index.dart';
import 'package:read/home/index.dart';
import 'package:read/sign/forget_pass.dart';
import 'package:read/sign/sign_in.dart';
import 'package:read/sign/welcome_sign.dart';
import 'package:read/sign_up/sign_up.dart';
import 'package:read/sign_up/sign_up_reading_info.dart';
import 'package:read/splach/intro_screens.dart';
import 'package:read/splach/splach_screen.dart';
import 'package:read/splach/welcome.dart';
import 'package:read/utils/devRead.dart';

class ConfigPage extends StatefulWidget {
  static const String routeName = "/";
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  ConfigBloc configBloc;

  bool _isAuthenticated = true;
  @override
  void initState() {
    super.initState();
    setupApp();
  }

  setupApp() {
    configBloc = ConfigBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => configBloc,
      child: BlocBuilder<ConfigBloc, ConfigState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Read',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: DevRead.fontfam,
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
            home: !_isAuthenticated ? HomePage() : Splash(),
            routes: {
              OnBoardingPage.routeName: (context) =>OnBoardingPage(),
              WelcomePage.routeName: (context) => WelcomePage(),
              Splash.routeName: (context) => Splash(),
              WelcomeSign.routeName: (context) => WelcomeSign(),
              LoginPage.routeName: (context) => LoginPage(),
              SignUp.routeName: (context) => SignUp(),
              ReadingInfo.routeName: (context) => ReadingInfo(),
              ForgetPassword.routeName: (context) => ForgetPassword(),
              HomePage.routeName: (context) => HomePage(),
            },
          );
        },
      ),
    );
  }
}
