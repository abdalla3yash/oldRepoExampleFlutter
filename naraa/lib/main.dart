// This sample shows adding an action to an [AppBar] that opeg cart.
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:naraa/pages/auth.dart';
import 'package:naraa/pages/course.dart';
import 'package:naraa/pages/course_admin.dart';
import 'package:naraa/pages/courses.dart';
import 'package:naraa/scoped_models/main.dart';
import './models/course.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  // debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  // debugPaintPointersEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final MainModel model = MainModel();
    return ScopedModel<MainModel>(
      model: model,
      child: MaterialApp(
        // debugShowMaterialGrid: true,
        theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.amber,
            accentColor: Colors.amberAccent,
            buttonColor: Colors.amberAccent),
        // home: AuthPage(),
        routes: {
          '/': (BuildContext context) => AuthPage(),
          '/courses': (BuildContext context) => CoursesPage(model),
          '/admin': (BuildContext context) => CoursesAdminPage(model),
        },

        onGenerateRoute: (RouteSettings settings) {
          final List<String> pathElements = settings.name.split('/');
          if (pathElements[0] != '') {
            return null;
          }
          if (pathElements[1] == 'course') {
            final String courseId = pathElements[2];
            final Course course = model.allCourses.firstWhere((Course course){
              return course.id == courseId;
            });
            return MaterialPageRoute<bool>(
              builder: (BuildContext context) =>
                  CoursePage(course),
            );
          }
          return null;
        },

        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
              builder: (BuildContext context) => CoursesPage(model));
        },
      ),
    );
  }
}
