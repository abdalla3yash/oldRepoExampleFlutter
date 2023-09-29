import 'package:flutter/material.dart';

class LogoutListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return ListTile(
//          leading: Icon(Icons.exit_to_app),
          title: Text('Logout',style: TextStyle(color: Colors.white,fontSize: 12.0),),
          onTap: () {},
        );
  }
}