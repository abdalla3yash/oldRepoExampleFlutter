import 'package:flutter/material.dart';
import 'package:iscan/view/session/new_session.dart';
import 'package:provider/provider.dart';
import 'package:iscan/provider/prod_provider.dart';
import 'package:iscan/provider/session_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: DBProvider(),
        ),
        ChangeNotifierProvider.value(
          value: ProdDBProvider(),
        )
      ],
      child: MaterialApp(
        title: 'iScan',
        theme: ThemeData(
          primarySwatch: Colors.amber,
          accentColor: Colors.amberAccent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: NewSession(),
      ),
    );
  }
}
