import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:read/locator.dart';
import 'file:///C:/work/project/read/lib/screens/home/home.dart';
import 'package:read/screens/login/login.dart';
import 'package:read/screens/register/sign_up_reading_info.dart';
import 'package:read/viewmodels/auth_provider.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => AuthProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '1read',
        theme: ThemeData(
          fontFamily: "SansSerif",
          backgroundColor: Colors.white,
          primarySwatch: Colors.orange,
          primaryColor: Colors.white,
          disabledColor: Colors.white,
          appBarTheme: AppBarTheme(
            elevation: 0.0,
          ),
        ),
          home: ReadingInfo(),
      ),
    );
  }
}

class ConditionalView extends StatefulWidget {
  @override
  _ConditionalViewState createState() => _ConditionalViewState();
}

class _ConditionalViewState extends State<ConditionalView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (ctx, authProvider, child) {
      if (authProvider.loggedIn) {
        return Home();
      } else {
        return Login();
      }
    });
  }
}
