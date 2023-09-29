import 'package:flutter/material.dart';

class ServiceDetailsPage extends StatelessWidget {
  final prod_detail_name;
  final prod_detail_picture;
  final prod_detail_price;
  final prod_detail_info;

  ServiceDetailsPage(
      {this.prod_detail_name,
      this.prod_detail_picture,
      this.prod_detail_price,
      this.prod_detail_info});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 240.0,
            child: GridTile(
              child: Container(
                color: Colors.white70,
                child: Image.asset(prod_detail_picture),
              ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(prod_detail_name),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text(
                          "\%${prod_detail_price}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(61, 64, 69, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

//  ==============buttons=================
          Row(
            children: <Widget>[
              Expanded(
                  child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return new AlertDialog(
                          title: new Text("qty"),
                          content: new Text("meal for number of persons "),
                          actions: <Widget>[
                            new MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: new Text("close"),
                            ),
                          ],
                        );
                      });
                },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: new Text("qty"),
                    ),
                    Expanded(
                      child: new Icon(Icons.arrow_drop_down),
                    )
                  ],
                ),
              )),
              Expanded(
                  child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return new AlertDialog(
                          title: new Text("order"),
                          content: new Text("chosse another meals"),
                          actions: <Widget>[
                            new MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: new Text("close"),
                            ),
                          ],
                        );
                      });
                },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: new Text("order"),
                    ),
                    Expanded(
                      child: new Icon(Icons.arrow_drop_down),
                    )
                  ],
                ),
              )),
              Expanded(
                  child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return new AlertDialog(
                          title: new Text("Ads"),
                          content: new Text("do you need salad or cola"),
                          actions: <Widget>[
                            new MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: new Text("close"),
                            ),
                          ],
                        );
                      });
                },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: new Text("Ads"),
                    ),
                    Expanded(
                      child: new Icon(Icons.arrow_drop_down),
                    )
                  ],
                ),
              )),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Color.fromRGBO(61, 64, 69, 1),
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: new Text("Orderd now"),
                ),
              ),
              new IconButton(
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: Color.fromRGBO(61, 64, 69, 1),
                  ),
                  onPressed: () {}),
              new IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: Color.fromRGBO(61, 64, 69, 1),
                  ),
                  onPressed: () {})
            ],
          ),
          Divider(),

          new ListTile(
            title: new Text('meal details'),
            subtitle: new Text(prod_detail_info),
          ),
        ],
      ),
    );
  }
}

class similar extends StatefulWidget {
  @override
  _similarState createState() => _similarState();
}

class _similarState extends State<similar> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
