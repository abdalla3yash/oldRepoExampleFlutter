import 'package:flutter/material.dart';


class InviteListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return ListTile(
  //        leading: Icon(Icons.insert_invitation,color: Color.fromRGBO(189, 169, 114, 1),),
          title: Text('Invite Friends',style: TextStyle(color: Colors.white,fontSize: 16.0)),
          onTap: () { },
        );
      }
  }