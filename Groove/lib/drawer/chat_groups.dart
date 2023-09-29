import 'package:dm_development/pages/Chat.dart';
import 'package:flutter/material.dart';


class ChatGroupListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return ListTile(
//          leading: Icon(Icons.chat,color: Color.fromRGBO(189, 169, 114, 1)),
          title: Text('Chat Group',style: TextStyle(color: Colors.white,fontSize: 16.0)),
          onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> ChatPage()),),
        );
      }
  }