import 'package:flutter/material.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:read/components/button.dart';
import 'package:read/components/rounded_input_field.dart';
import 'package:read/models/list_item.dart';
import 'file:///C:/work/project/read/lib/screens/location/user_location_input.dart';
import 'package:read/screens/views/dev_page.dart';
import 'package:dropdownfield/dropdownfield.dart';

class ReadingInfo extends StatefulWidget {
  @override
  _ReadingInfoState createState() => _ReadingInfoState();
}

class _ReadingInfoState extends State<ReadingInfo> {
  List _myActivities;
  String _myActivitiesResult;
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myActivities = [];
    _myActivitiesResult = '';
  }

  Item selectedUser;
  List<Item> users = <Item>[
    const Item(
      'Getting Started',
    ),
    const Item(
      '1 book / year',
    ),
    const Item(
      ' 2 - 5 books / year',
    ),
    const Item(
      ' 6  12 books / year',
    ),
    const Item(' More Than That'),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(children: <Widget>[
            SizedBox(height: size.height * 0.1),
            DevPage(
              title1: 'READING ',
              title2: 'APPETITE',
              subtitle: 'What’s get you excited about reading',
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              width: size.width * 0.9,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: DropdownButtonFormField<Item>(
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
                hint: Text("    Reading Frequency"),
                value: selectedUser,
                onChanged: (Item Value) {
                  setState(() {
                    selectedUser = Value;
                  });
                },
                items: users.map((Item user) {
                  return DropdownMenuItem<Item>(
                    value: user,
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: size.width * 0.05,
                        ),
                        Text(
                          user.name,
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: size.height * 0.025,
            ),
            RoundedInputField(
              hintText: 'Favourite Book',
            ),
            SizedBox(
              height: size.height * 0.025,
            ),
            Container(
              width: size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: MultiSelectFormField(
                  fillColor: Colors.white,
                  autovalidate: false,
                  titleText: 'Favourite Genres',
                  validator: (value) {
                    if (value == null || value.length == 0) {
                      return 'Please select one or more options';
                    }
                  },
                  dataSource: [
                    {
                      "display": "Running",
                      "value": "Running",
                    },
                    {
                      "display": "Climbing",
                      "value": "Climbing",
                    },
                    {
                      "display": "Walking",
                      "value": "Walking",
                    },
                    {
                      "display": "Swimming",
                      "value": "Swimming",
                    },
                    {
                      "display": "adventure",
                      "value": "adventure",
                    },
                    {
                      "display": "academic",
                      "value": "academic",
                    },
                    {
                      "display": "agriculture",
                      "value": "agriculture",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                  okButtonLabel: 'OK',
                  cancelButtonLabel: 'CANCEL',
                  // required: true,
                  hintText: 'Please choose one or more',
                  initialValue: _myActivities,
                  onSaved: (value) {
                    if (value == null) return;
                    setState(() {
                      _myActivities = value;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Button(
              text1: 'Continue',
              height: 60,
              width: size.width * 0.9,
              color: Color.fromRGBO(250, 166, 26, 1),
              textcolor: Colors.white,
              textsize: 16,
              onTap: () {},
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).pushReplacement(
                  new MaterialPageRoute(
                      builder: (context) => new UserLocation())),
              child: Center(
                child: Text(
                  'Skip this step',
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(90, 90, 90, 1),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
