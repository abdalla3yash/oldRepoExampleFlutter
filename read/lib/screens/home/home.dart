import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:read/base/model.dart';
import 'package:read/base/view.dart';
import 'package:read/components/drawer.dart';
import 'package:read/components/social_sign.dart';
import 'package:read/screens/login/login.dart';
import 'package:read/viewmodels/auth_provider.dart';
import 'package:read/viewmodels/home.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_widgets/library_screen.dart';
import 'home_widgets/read_screen.dart';
import 'home_widgets/requests_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  String _name;
  GlobalKey<ScaffoldState> _k = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    return BaseView<HomeModel>(builder: (context, model, child) {
      return Scaffold(
        key: _k,
        body: model.state == ViewState.Busy
            ? Center(child: CircularProgressIndicator())
            : _homeView(model, context),
      );
    });
  }

  Widget _homeView(HomeModel model, BuildContext context) {

    return DefaultTabController(
      length: 3,
      child: new Scaffold(
        appBar: new PreferredSize(
          preferredSize: Size.fromHeight(150.0),
          child: new Container(
            color: Colors.white,
            child: new SafeArea(
              child: Column(
                children: <Widget>[
                  homeAppBar(),
                  getSearchBarUI(),
                  new TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    labelPadding: const EdgeInsets.only(top: 8),
                    indicatorColor: Color.fromRGBO(251, 169, 0, 1),
                    tabs: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: new Text(
                          "All Library",
                          style: TextStyle(
                              fontSize: 19,
                              color: Color.fromRGBO(51, 51, 51, 1)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: new Text(
                          "Requests",
                          style: TextStyle(
                              fontSize: 19,
                              color: Color.fromRGBO(51, 51, 51, 1)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: new Text(
                          'Reads',
                          style: TextStyle(
                              fontSize: 19,
                              color: Color.fromRGBO(51, 51, 51, 1)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: new TabBarView(
          children: <Widget>[
            LibraryScreen(),
            RequestsScreen(),
            ReadScreen(),
          ],
        ),
      ),
    );
  }

  Widget homeAppBar() {
    var _counter = 4;
    return Container(
      alignment: Alignment.center,
      child: AppBar(
        title: Image.asset(
          'assets/logo.png',
          width: 70,
          height: 45,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            size: 30,
            color: Color.fromRGBO(251, 169, 0, 1),
          ),
          onPressed: () =>
              Provider.of<AuthProvider>(context, listen: false).logout(),
        ),
        actions: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            width: 25,
            height: 25,
            child: Stack(
              children: [
                Icon(
                  Icons.notifications_none,
                  color: Color.fromRGBO(251, 169, 0, 1),
                  size: 25,
                ),
                Container(
                  width: 25,
                  height: 25,
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(top: 5),
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(color: Colors.white, width: 1)),
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Center(
                        child: Text(
                          _counter.toString(),
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
//                              Navigator.push(
//                                context,
//                                MaterialPageRoute(
//                                    builder: (context) => DrawerPage()),
//                              );
          ),
        ],
      ),
    );
  }

  Widget getSearchBarUI() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 40,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, right: 16),
                    child: TextFormField(
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(120, 132, 158, 1),
                      ),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Search by Title | Author | ISBN',
                        border: InputBorder.none,
                        labelStyle: TextStyle(
                          fontSize: 14,
                          letterSpacing: 0.2,
                          color: Color.fromRGBO(120, 132, 158, 1),
                        ),
                      ),
                      onEditingComplete: () {},
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                  height: 22,
                  child: Icon(Icons.import_export, color: Colors.black),
                ),
                SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        onPressed: () {}),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

}
