import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:use/agenda/session.dart';
import 'package:use/agenda/session_list.dart';
import 'package:use/universal/dev_scaffold.dart';
import 'package:use/utils/tools.dart';

class AgendaPage extends StatelessWidget {
  static const String routeName = '/agenda';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: DevScaffold(
          title: 'Agenda',
          tabBar: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Tools.multiColors[Random().nextInt(4)],
            isScrollable: false,
            labelStyle: TextStyle(fontSize: 12),
            tabs: <Widget>[
              Tab(
                child: Text('Cloud'),
                icon: Icon(
                  FontAwesomeIcons.cloud,
                  size: 12,
                ),
              ),
              Tab(
                child: Text('Mobile'),
                icon: Icon(
                  FontAwesomeIcons.mobile,
                  size: 12,
                ),
              ),
              Tab(
                child: Text('web & more'),
                icon: Icon(
                  FontAwesomeIcons.chrome,
                  size: 12,
                ),
              ),
            ],
          ),
          body: TabBarView(children: <Widget>[
            SessionList(
              allSession: sessions,
            ),
            SessionList(
              allSession: sessions,
            ),
            SessionList(
              allSession: sessions,
            ),
          ]),
        ));
  }
}
