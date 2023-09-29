import 'package:dm_development/pages/services.dart';
import 'package:flutter/material.dart';


class ServicesListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
   //   leading: Icon(Icons.settings_input_svideo,color: Color.fromRGBO(189, 169, 114, 1),),
      title: Text('Services',style: TextStyle(color: Colors.white,fontSize: 16.0),),
      onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> products()),),
    );
  }
}