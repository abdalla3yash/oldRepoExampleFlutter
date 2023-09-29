import 'package:dm_development/pages/payments.dart';
import 'package:flutter/material.dart';


class PaymentListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return ListTile(
//          leading: Icon(Icons.chrome_reader_mode,color: Color.fromRGBO(189, 169, 114, 1)),
          title: Text('Payments',style: TextStyle(color: Colors.white,fontSize: 16.0),),
          onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> PaymentPage()),),
        );
      }
  }