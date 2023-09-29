import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:use/market/session.dart';
import 'package:use/utils/tools.dart';

class SessionList extends StatelessWidget {
  final List<Session> allSession;

  const SessionList({Key key, this.allSession}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('market').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              Text('Loading'); // <---- no return here
            } else {
              child:
              ListView.builder(
                  shrinkWrap: false,
                  itemCount: allSession.length,
                  itemBuilder: ((context, index) =>
                      _buildListItem(context, snapshot.data.documents[index])));
            }
          }),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return Card(
      elevation: 0.0,
      child: ListTile(
        onTap: () async {
          await FlutterPhoneDirectCaller.callNumber(document['number']);
        },
        isThreeLine: true,
        trailing: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: '9:00 AM',
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: document['sessionStartTime'],
                  style: Theme.of(context)
                      .textTheme
                      .subtitle
                      .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ]),
        ),
        title: RichText(
          text: TextSpan(
              text: '${document['sessionTitle']}\n',
              style: Theme.of(context).textTheme.title.copyWith(fontSize: 16),
              children: [
                TextSpan(
                    text: document['speakerName'],
                    style: Theme.of(context).textTheme.subtitle.copyWith(
                        fontSize: 14,
                        color: Tools.multiColors[Random().nextInt(4)]))
              ]),
        ),
        subtitle: Text(
          document['speakerDesc'],
          style: Theme.of(context).textTheme.caption.copyWith(fontSize: 10),
        ),
      ),
    );
  }
}
