import 'package:flutter/material.dart';
import 'package:read/components/button.dart';
import 'package:read/components/rounded_input_field.dart';

class ReadingInfo extends StatefulWidget {

  @override
  _ReadingInfoState createState() => _ReadingInfoState();
}

class _ReadingInfoState extends State<ReadingInfo> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(children: <Widget>[
            SizedBox(height: size.height * 0.1),

            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: <Widget>[
                  Text(
                    'READING ',
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                  Text(
                    'APPETITE',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text('What’s get you excited about reading',
                    style: TextStyle(
                      fontSize: 17.0,
                    )),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Reading Frequency',
                        style: TextStyle(
                            color: Color.fromRGBO(119, 119, 119, 1),
                            fontSize: 14),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 14),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: Color.fromRGBO(119, 119, 119, 1),
                        size: 17,
                      ),
                    ),
                  ],
                ),
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
            InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Favourite Genres',
                        style: TextStyle(
                            color: Color.fromRGBO(119, 119, 119, 1),
                            fontSize: 14),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 14),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: Color.fromRGBO(119, 119, 119, 1),
                        size: 17,
                      ),
                    ),
                  ],
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
              onTap: () {},
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
