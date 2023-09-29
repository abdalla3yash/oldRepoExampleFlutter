import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:iscan/models/session.dart';
import 'package:iscan/provider/session_provider.dart';
import 'package:iscan/view/session/session_list.dart';
import 'package:provider/provider.dart';

class NewSession extends StatefulWidget {
  @override
  _NewSessionState createState() => _NewSessionState();
}

class _NewSessionState extends State<NewSession> {
  TextEditingController controller = TextEditingController();

  String date =
      DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now()).toString();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        final FormState form = _formKey.currentState;

        if (form.validate()) {
          SessionModel taskModel = SessionModel(controller.text, date, false);
          Provider.of<DBProvider>(context, listen: false)
              .insertNewData(taskModel);
          controller.clear();
          Navigator.of(context).pop();
          Fluttertoast.showToast(
            msg: 'Session Created Succesfully!',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
          );
        }
      },
    );

    Widget cancel = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        controller.clear();

        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
      title: Text('Add New Session'),
      content: TextFormField(
        controller: controller,
        decoration: new InputDecoration(
          labelText: 'Session Name',
        ),
        validator: (val) => val.isEmpty ? "Enter Session Name" : null,
        onChanged: (val) {
          debugPrint('Something changed in Title Text Field');
        },
      ),
      actions: [
        cancel,
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Form(
          key: _formKey,
          child: alert,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Scaner',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: AllSessions(),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  onPressed: () {
                    showAlertDialog(context);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: Text(
                    'New Session',
                    style: TextStyle(fontSize: 22),
                  ),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
