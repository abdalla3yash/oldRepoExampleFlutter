import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:read/components/button.dart';
import 'package:read/components/star_rating.dart';

class BooksTile extends StatelessWidget {
  final String imgAssetPath,
      title,
      description,
      author,
      review_score,
      review_summary;
  final int rating;
  BooksTile(
      {@required this.rating,
      @required this.description,
      @required this.title,
      @required this.imgAssetPath,
      @required this.author,
      @required this.review_score,
      @required this.review_summary});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      alignment: Alignment.bottomLeft,
      child: Stack(
        children: <Widget>[
          Container(
            height: 100,
            alignment: Alignment.center,
            child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 100,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,borderRadius: BorderRadius.circular(10),
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
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 70,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            title,
                            style: TextStyle(
                                color: Color.fromRGBO(51, 51, 51, 1),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4,),

                          Text(
                            author,
                            style: TextStyle(color: Colors.black, fontSize: 8),
                          ),
                          SizedBox(height: 4,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  StarRating(
                                    rating: rating,
                                  ),
                                  SizedBox(width: 15,),
                                  Text(
                                    review_score,
                                    style: TextStyle(
                                        color: Color.fromRGBO(102, 102, 102, 1),
                                        fontSize: 8),
                                  ),
                                  SizedBox(width: 15,),

                                  Text(
                                    review_summary,
                                    style: TextStyle(
                                        color: Color.fromRGBO(102, 102, 102, 1),
                                        fontSize: 8),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CircleAvatar(
                                radius: 12,
                                backgroundImage: AssetImage('assets/profile.jpg'),
                              ),
                              SizedBox(width: 5,),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Aly Zakaria",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 8),
                                      ),
                                      Text(
                                        "New Cairo",
                                        style: TextStyle(
                                            color: Color.fromRGBO(102, 102, 102, 1),
                                            fontSize: 5),
                                      ),
                                      Text(
                                        "5 KM away",
                                        style: TextStyle(
                                            color: Color.fromRGBO(102, 102, 102, 1),
                                            fontSize: 5),
                                      ),

                                    ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20,top: 5),
                                child: Container(
                                  height: 18,
                                  width: 70,
                                  child: Material(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color:  Color.fromRGBO(0, 0, 0, 0.16),
                                    child: GestureDetector(

                                      child: Center(
                                        child: Text(
                                          "Requests",
                                          style: TextStyle(
                                            fontSize: 8.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            ],

                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
          Container(
            height: 100,
            margin: EdgeInsets.only(
              left: 12,
              top: 6,
            ),
            child: Image.asset(
              imgAssetPath,
              height: 100,
              width: 80,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
