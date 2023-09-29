import 'package:flutter/material.dart';
import 'package:naraa/scoped_models/main.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:naraa/models/course.dart';
import 'package:naraa/widget/courses/address_tag.dart';
import 'package:naraa/widget/courses/price_tag.dart';
import 'package:naraa/widget/ui_elements/title_default.dart';

class CourseCard extends StatelessWidget {
  final Course courses;
  final int courseIndex;

  CourseCard(this.courses, this.courseIndex);

  Widget _buildTextPriceRow() {
    return Container(
        padding: EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TitleDefault(courses.title),
            SizedBox(
              width: 8.0,
            ),
            PriceTag(courses.price.toString()),
          ],
        ));
  }

  Widget _buildButtonsAction(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.info),
                color: Theme.of(context).accentColor,
                onPressed: () => Navigator.pushNamed<bool>(
                    context, '/course/' + model.allCourses[courseIndex].id),
              ),
              IconButton(
                icon: Icon(model.allCourses[courseIndex].isFavourite
                    ? Icons.favorite
                    : Icons.favorite_border),
                color: Colors.red,
                onPressed: () {
                  model.selectCourse(model.allCourses[courseIndex].id);
                  model.toggleCourseFavoriteStatus();
                },
              ),
            ]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(courses.image),
            height: 300.0,
            fit: BoxFit.cover,
            placeholder: AssetImage('assets/food.jpg'),
          ),
          _buildTextPriceRow(),
          AddressTag("that's my course, enjoy"),
          Text(courses.userEmail),
          _buildButtonsAction(context),
        ],
      ),
    );
  }
}
