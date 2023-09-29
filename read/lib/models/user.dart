import 'package:flutter/cupertino.dart';

class User {
  final String id;
  String name;
  String token;

  User({this.id, this.name, @required this.token});

  User.initial()
      : id = '',
        name = '',
        token = '';

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      token: json['token'],
      name: json['name'],
    );
  }
}
