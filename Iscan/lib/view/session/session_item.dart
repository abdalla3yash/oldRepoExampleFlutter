import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iscan/models/products.dart';
import 'package:iscan/models/session.dart';
import 'package:iscan/view/session/exist_session.dart';
import 'package:iscan/widgets/tools.dart';

class SessionItem extends StatelessWidget {
  final SessionModel taskModel;
  final ProductsModal productsModal;
  SessionItem(this.taskModel, this.productsModal);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ExistSession(this.taskModel, this.productsModal)),
        );
      },
      child: Card(
          child: ListTile(
        title: Text(taskModel.sessiontitle),
        trailing: Container(
          decoration: BoxDecoration(
              color: Tools.multiColors[Random().nextInt(8)],
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              taskModel.sessiondate,
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
      )),
    );
  }
}
