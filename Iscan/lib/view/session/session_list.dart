import 'package:flutter/material.dart';
import 'package:iscan/models/products.dart';
import 'package:iscan/models/session.dart';
import 'package:iscan/provider/session_provider.dart';
import 'package:iscan/view/session/session_item.dart';
import 'package:provider/provider.dart';

class AllSessions extends StatelessWidget {
  int quentity;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<DBProvider>(
      builder: (context, DBProvider value, child) {
        return FutureBuilder<List<SessionModel>>(
          future: value.getAllSessions(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                List<SessionModel> sessions = snapshot.data;
                if (sessions.length == 0) {
                  return Center(
                    child: Text(
                      'No Sessions Found!',
                      style: TextStyle(color: Theme.of(context).disabledColor),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: sessions.length,
                  itemBuilder: (context, index) {
                    return SessionItem(sessions[index],
                        ProductsModal('', quentity, sessions[index].sessionid));
                  },
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      },
    );
  }
}
