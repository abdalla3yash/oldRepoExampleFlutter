import 'package:flutter/material.dart';
import './course_create.dart';
import './course_list.dart';
import '../scoped_models/main.dart';

class CoursesAdminPage extends StatelessWidget {
  final MainModel model;

  CoursesAdminPage(this.model);

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Choose'),
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('All Courses'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/courses');
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: _buildSideDrawer(context),
        appBar: AppBar(
          title: Text('Manage Courses'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.create),
                text: 'Create Course',
              ),
              Tab(
                icon: Icon(Icons.list),
                text: 'My Courses',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[CourseCreatePage(), CourseListPage(model)],
        ),
      ),
    );
  }
}
