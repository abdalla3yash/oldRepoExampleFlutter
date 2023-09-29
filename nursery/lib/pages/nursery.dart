import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import '../models/nursery.dart';

// ignore: must_be_immutable
class NurseryPage extends StatelessWidget {
  final Nursery nursery;

  NurseryPage(this.nursery);

  // ignore: non_constant_identifier_names
  Widget image_carousel = new Container(
    height: 300.0,
    child: new Carousel(
      boxFit: BoxFit.cover,
      images: [
        AssetImage('assets/nursery3.jpg'),
        AssetImage('assets/nursery2.jpg'),
        AssetImage('assets/nursery1.jpg'),
        AssetImage('assets/nursery4.jpg'),
        AssetImage('assets/nursery5.jpg'),
      ],
      autoplay: true,
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(milliseconds: 1000),
      dotSize: 4.0,
      indicatorBgPadding: 5.0,
      dotBgColor: Colors.transparent,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: 250,
              width: double.infinity,
              child: image_carousel,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16.0, 200.0, 16.0, 16.0),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(16.0),
                        margin: EdgeInsets.only(top: 16.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 96.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    nursery.title,
                                    style: Theme.of(context).textTheme.title,
                                  ),
                                  ListTile(
                                    contentPadding: EdgeInsets.all(0),
                                    title: Text("National ID"),
                                    subtitle: Text("cairo"),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.0),
                          ],
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                image: AssetImage('assets/baby.jpg'),
                                fit: BoxFit.cover)),
                        margin: EdgeInsets.only(left: 16.0),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text("Baby information"),
                        ),
                        Divider(),
                        ListTile(
                          title: Text("blood type"),
                          subtitle: Text(nursery.bloodType),
                          leading: Icon(Icons.merge_type),
                        ),
                        ListTile(
                          title: Text("Child type"),
                          subtitle: Text("male"),
                          leading: Icon(Icons.accessibility),
                        ),
                        ListTile(
                          title: Text("Diseases"),
                          subtitle: Text("no, thanks god"),
                          leading: Icon(Icons.supervised_user_circle),
                        ),
                        ListTile(
                          title: Text("About"),
                          subtitle: Text(nursery.description),
                          leading: Icon(Icons.person),
                        ),
                        ListTile(
                          title: Text("Joined Date"),
                          subtitle: Text("15 February 2019"),
                          leading: Icon(Icons.calendar_view_day),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            )
          ],
        ),
      ),
    );
  }
}

/*
  Widget _buildAddressPriceRow(String age) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'your child in our eyes',
          style: TextStyle(color: Colors.grey),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(
            '|',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Text(
          age.toString(),
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('Back button pressed!');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(nursery.title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FadeInImage(
              image: AssetImage('assets/baby.jpg'),
              height: 300.0,
              fit: BoxFit.cover,
              placeholder: AssetImage('assets/baby.jpg'),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: TitleDefault(nursery.title),
            ),
            _buildAddressPriceRow(nursery.age),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                nursery.description,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                nursery.code,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                nursery.bloodType,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
