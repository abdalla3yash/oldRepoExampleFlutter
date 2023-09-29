import 'package:flutter/material.dart';
import 'package:naraa/scoped_models/main.dart';
import 'package:naraa/widget/courses/courses.dart';
import 'package:scoped_model/scoped_model.dart';


class CoursesPage extends StatefulWidget {
  final MainModel model;

  CoursesPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return _CoursesPageState();
  }
}

class _CoursesPageState extends State<CoursesPage> {
  @override
  initState() {
    widget.model.fetchCourses();
    super.initState();
  }

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Choose'),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage Products'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/admin');
            },
          )
        ],
      ),
    );
  }

  Widget _buildCoursesList() {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        Widget content = Center(child: Text('No Courses Found!'));
        if (model.displayedCourses.length > 0 && !model.isLoading) {
          content = Courses();
        } else if (model.isLoading) {
          content = Center(child: CircularProgressIndicator());
        }
        return RefreshIndicator(onRefresh: model.fetchCourses, child: content,) ;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildSideDrawer(context),
      appBar: AppBar(
        title: Text('home page'),
        actions: <Widget>[
          ScopedModelDescendant<MainModel>(
            builder: (BuildContext context, Widget child, MainModel model) {
              return IconButton(
                icon: Icon(model.displayFavoritesOnly
                    ? Icons.favorite
                    : Icons.favorite_border),
                onPressed: () {
                  model.toggleDisplayMode();
                },
              );
            },
          )
        ],
      ),
      body: _buildCoursesList(),
    );
  }
}
