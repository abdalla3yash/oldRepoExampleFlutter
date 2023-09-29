import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          category(
            image_location: 'assets/fish.png',
            image_caption:'Fishs' ,
          ),
          category(
            image_location: 'assets/roasted_chicken.png',
            image_caption:'Chicken' ,
          ),
          category(
            image_location: 'assets/apple.png',
            image_caption:'Fruits' ,
          ),
          category(
            image_location: 'assets/cabbage.png',
            image_caption:'vegetables' ,
          ),
          category(
            image_location: 'assets/cocktail.png',
            image_caption:'cold drinks' ,
          ),
          category(
            image_location: 'assets/coffee.png',
            image_caption:'hot drinks' ,
          ),
        ],
      ),
    );
  }
}

class category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  category({this.image_caption, this.image_location});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 80.0,
          child: ListTile(
            title: Image.asset(image_location, width: 60.0, height: 60.0),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(image_caption,style: new TextStyle(fontSize: 11.0,color: Colors.black),),
            )
          ),
        ),
      ),
    );
  }
}
