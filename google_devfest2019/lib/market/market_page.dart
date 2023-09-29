import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:use/market/session.dart';
import 'package:use/market/session_list.dart';
import 'package:use/universal/dev_scaffold.dart';
import 'package:use/utils/tools.dart';

class MarketPage extends StatelessWidget {
  static const String routeName = '/market';

  @override
  Widget build(BuildContext context) {
    return DevScaffold(
      title: 'الماركت',
      body: SessionList(
        allSession: markets,
      ),
    );
  }
}
