import 'package:flutter/material.dart';
import 'package:naraa/models/course.dart';
import 'package:naraa/scoped_models/main.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:naraa/widget/courses/course_card.dart';
import './course_card.dart';

class Courses extends StatelessWidget {

  Widget _buildCourseList(List<Course> courses) {
    Widget courseCards;
    if (courses.length > 0) {
      courseCards = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            CourseCard(courses[index], index),
        itemCount: courses.length,
      );
    } else {
      courseCards = Container();
    }
    return courseCards;
  }

  @override
  Widget build(BuildContext context) {
    print('[courses Widget] build()');
    return ScopedModelDescendant<MainModel>(builder: (BuildContext context, Widget child, MainModel model){

      return _buildCourseList(model.displayedCourses);
    },);
  }
}
