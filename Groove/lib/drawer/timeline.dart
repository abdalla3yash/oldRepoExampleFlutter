
import 'package:dm_development/pages/timeline.dart';
import 'package:flutter/material.dart';


class TimeLineListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
  //    leading: Icon(Icons.insert_invitation,color: Color.fromRGBO(189, 169, 114, 1),),
      title: Text('TimeLine',style: TextStyle(color: Colors.white,fontSize: 16.0),),
      onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> TimelinePage()),),
    );
  }
}