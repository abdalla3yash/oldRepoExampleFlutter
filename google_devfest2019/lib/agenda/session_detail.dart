import 'package:flutter/material.dart';
import 'package:use/agenda/session.dart';
import 'package:use/universal/dev_scaffold.dart';

class SessionDetail extends StatelessWidget {
  static const String routeName = '/session_detail';
  final Session session;

  const SessionDetail({Key key, @required this.session}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DevScaffold(
      title: session.speakerName,
      body: SingleChildScrollView(),
    );
  }
}
