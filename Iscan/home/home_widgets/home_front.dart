import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:read/drawer.dart';
import 'package:read/home/home_widgets/library_screen.dart';
import 'package:read/home/home_widgets/read_screen.dart';
import 'package:read/home/home_widgets/requests_screen.dart';
import 'package:read/utils/devRead.dart';

class HomeFront extends StatefulWidget {
  @override
  _HomeFrontState createState() => _HomeFrontState();
}

class _HomeFrontState extends State<HomeFront>
    with SingleTickerProviderStateMixin {
  String searchQuery = "Search query";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  AppBar(
                    title: Image.asset(
                      DevRead.logo,
                      width: 143,
                    ),
                    actions: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 16, bottom: 10),
                        child: IconButton(
                            icon: Icon(Icons.menu),
                            iconSize: 40.0,
                            color: Color.fromRGBO(251, 169, 0, 1),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DrawerPage()),
                              );
                            }),
                      ),
                    ],
                  ),
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

  Widget getSearchBarUI() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 50,
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
                      color: Color.fromRGBO(252, 167, 0, 1),
                    ),
                    child: IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
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

/*    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          DevRead.logo,
          width: 143,
        ),
        flexibleSpace: AppBar(
          title: Image.asset(
            DevRead.logo,
            width: 143,
          ),
        ),
        bottom: new TabBar(
          controller: _tabController,
          indicatorColor: Color.fromRGBO(251, 169, 0, 1),
          indicatorSize: TabBarIndicatorSize.label,

          tabs: <Widget>[
            new Tab(text: "All Library"),
            new Tab(text: "Requests"),
            new Tab(text: "Reads"),
          ],
        ),
      ),
      endDrawer: Drawer(),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          LibraryScreen(),
          RequestsScreen(),
          ReadScreen(),
        ],
      ),
    );
  }
}
*/
