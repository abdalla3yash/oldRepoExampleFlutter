import 'package:flutter/material.dart';

class NewPost extends StatefulWidget {
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100.0,
        padding: EdgeInsets.all(10.0),
        // color: Colors.redAccent,
        child: Card(
          child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://scontent.fbkk5-3.fna.fbcdn.net/v/t1.0-9/15267619_10154789415276098_1443357584742520709_n.jpg?_nc_cat=103&_nc_eui2=AeHuPeABmNHVHNpJgJ00gVIAjRAxxXJZ_96UDcsaOCG8-e3G_brNJ_nMrKTDV1Wx-qMAz1pw_XBqcY3YhY87vgU1-py_G_VSaJy6RHQUHjrBAQ&oh=c6ccfa1910c5e9908fc779903f1b78db&oe=5C5F4BA1")))),
                      Text("What's your mind?")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {},
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.videocam, color: Colors.red[400]),
                            Text('Live')
                          ],
                        ),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.photo, color: Colors.green),
                            Text('Photos')
                          ],
                        ),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.place, color: Colors.pink),
                            Text('Check-in')
                          ],
                        ),
                      )
                    ],
                  )
                ],
              )),
        ));
  }
}
