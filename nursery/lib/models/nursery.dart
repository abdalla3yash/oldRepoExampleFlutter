import 'package:flutter/material.dart';

class Nursery {
  final String id;
  final String title;
  final String description;
  final String age;
  final String code;
  final String image;
  final String heat;
  final String motion;
  final String bloodType;
  final bool isFavorite;
  final String userEmail;
  final String userId;

  Nursery(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.age,
      @required this.code,
      @required this.image,
      @required this.heat,
      @required this.motion,
      @required this.bloodType,
      @required this.userEmail,
      @required this.userId,
      this.isFavorite = false});
}
