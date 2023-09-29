import 'package:dm_development/pages/profile.dart';
import 'package:flutter/material.dart';


class AccountDetailsListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return ListTile(
   //       leading: Icon(Icons.person_pin,color: Color.fromRGBO(189, 169, 114, 1)),
          title: Text('Profile',style: TextStyle(color: Colors.white,fontSize: 16.0),),
          onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> ProfilePage("Profile")),),
        );
      }
  }