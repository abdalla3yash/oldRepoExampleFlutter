
import 'package:dm_development/pages/serviceDetails.dart';
import 'package:flutter/material.dart';

class products extends StatelessWidget {
  var product_list = [
    {
      "name": "Cleaner",
      "picture": "assets/house.png",
      "rating": 4.65,
      "info":
      "lab lab ra5i kt4eer that's fra5 oh shit its chicken not meaning someone empety hope to you be sad couse you see all this food and finally eating eggs"
    },
    {
      "name": "Barber",
      "picture": "assets/barber.png",
      "rating": 4.8,
      "info":
      "lab lab ra5i kt4eer that's fra5 oh shit its chicken not meaning someone empety hope to you be sad couse you see all this food and finally eating eggs",
    },
    {
      "name": "Electrication",
      "picture": "assets/Electricion.png",
      "rating": 4.73,
      "info":
      "lab lab ra5i kt4eer that's fra5 oh shit its chicken not meaning someone empety hope to you be sad couse you see all this food and finally eating eggs"
    },
    {
      "name": "plumber",
      "picture": "assets/water.png",
      "rating": 4.73,
      "info":
          "lab lab ra5i kt4eer that's fra5 oh shit its chicken not meaning someone empety hope to you be sad couse you see all this food and finally eating eggs"
    },
    {
      "name": "fire faiting",
      "picture": "assets/fire.png",
      "rating": 5,
      "info":
          "lab lab ra5i kt4eer that's fra5 oh shit its chicken not meaning someone empety hope to you be sad couse you see all this food and finally eating eggs"
    },
    {
      "name": "painting",
      "picture": "assets/painting.jpg",
      "rating": 4.98,
      "info":
          "lab lab ra5i kt4eer that's fra5 oh shit its chicken not meaning someone empety hope to you be sad couse you see all this food and finally eating eggs"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return SingleService(
            prod_name: product_list[index]['name'],
            prod_picture: product_list[index]['picture'],
            prod_price: product_list[index]['rating'],
            prod_info: product_list[index]['info'],
          );
        }),
    );
  }
}

class SingleService extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_price;
  final prod_info;

  SingleService(
      {this.prod_name, this.prod_picture, this.prod_price, this.prod_info});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: prod_name,
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder: (context) => new ServiceDetailsPage(
                          prod_detail_name: prod_name,
                          prod_detail_picture: prod_picture,
                          prod_detail_price: prod_price,
                          prod_detail_info: prod_info,
                        ),
                  ),
                ),
            child: GridTile(
                footer: Container(
                  color: Colors.white70,
                  child: ListTile(
                    leading: Text(prod_name,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    title: Text(
                      "\%$prod_price",
                      style: TextStyle(
                          color: Color.fromRGBO(61, 64, 69, 1),
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
                child: Image.asset(
                  prod_picture,
                  fit: BoxFit.cover,
                )),
          ),
        ),
      ),
    );
  }
}
