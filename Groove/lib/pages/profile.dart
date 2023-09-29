import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ProfilePage extends StatefulWidget {
  ProfilePage(this.title);

  final String title;

  @override
  _ProfilePageState createState() => new _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final String imgUrl =
        'assets/profile.png';

    return new Stack(
      children: <Widget>[
        new Container(
          color: Color.fromRGBO(61, 64, 69, 1),
        ),
        new Image.network(
          imgUrl,
          fit: BoxFit.fill,
        ),
        new BackdropFilter(
            filter: new ui.ImageFilter.blur(
              sigmaX: 6.0,
              sigmaY: 6.0,
            ),
            child: new Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(61, 64, 69, 1),
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
            )),
        new Scaffold(
            body: new Center(
              child: new Column(
                children: <Widget>[
                  new SizedBox(
                    height: _height / 12,
                  ),
                  new CircleAvatar(
                    radius: _width < _height ? _width / 4 : _height / 4,
                    backgroundImage: AssetImage(imgUrl),
                  ),
                  new SizedBox(
                    height: _height / 25.0,
                  ),
                  new Text(
                    'Username',
                    style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: _width / 15,
                        color: Colors.black),
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(
                        top: _height / 30, left: _width / 8, right: _width / 8),
                    child: new Text(
                      'nasr city .\nSometime I work at google as Executive Chairman ',
                      style: new TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: _width / 25,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  new Divider(
                    height: _height / 30,
                    color: Colors.black,
                  ),
                ],
              ),
            ))
      ],
    );
  }

  Widget rowCell(int count, String type) => new Expanded(
          child: new Column(
        children: <Widget>[
          new Text(
            '$count',
            style: new TextStyle(color: Colors.white),
          ),
          new Text(type,
              style: new TextStyle(
                  color: Colors.white, fontWeight: FontWeight.normal))
        ],
      ));
}
