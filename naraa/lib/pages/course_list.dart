import 'package:flutter/material.dart';
import 'package:naraa/pages/course_create.dart';
import 'package:naraa/scoped_models/main.dart';
import 'package:scoped_model/scoped_model.dart';

class CourseListPage extends StatefulWidget {
  final MainModel model;

  CourseListPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return _CourseListPageState();
  }
}

class _CourseListPageState extends State<CourseListPage> {
  @override
  initState() {
    widget.model.fetchCourses();
    super.initState();
  }

  Widget _buildEditButton(BuildContext context, int index, MainModel model) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        model.selectCourse(model.allCourses[index].id);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return CourseCreatePage();
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(model.allCourses[index].title),
              onDismissed: (DismissDirection direction) {
                if (direction == DismissDirection.endToStart) {
                  model.selectCourse(model.allCourses[index].id);
                  model.deletecourse();
                } else if (direction == DismissDirection.startToEnd) {
                  print('Swiped start to end');
                } else {
                  print('Other swiping');
                }
              },
              background: Container(color: Colors.red),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                      NetworkImage(model.allCourses[index].image),
                    ),
                    title: Text(model.allCourses[index].title),
                    subtitle:
                    Text('\$${model.allCourses[index].price.toString()}'),
                    trailing: _buildEditButton(context, index, model),
                  ),
                  Divider()
                ],
              ),
            );
          },
          itemCount: model.allCourses.length,
        );
      },
    );
  }
}
