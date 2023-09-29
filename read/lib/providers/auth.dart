import 'dart:convert';
import 'package:read/screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:read/components/notafication_text.dart';
import 'package:read/models/user.dart';
import 'package:http/http.dart' as http;

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }
class AuthProvider with ChangeNotifier{

  static final BASE_URL = "http://www.mocky.io/v2/5b3a63e02e0000da161581f1";

  Future<User> login(String username, String password) {
    return http.post(BASE_URL, body: {
      "username": username,
      "password": password
    }).then((dynamic res) {
      print(res.toString());
      return new User(username, password);
    });
  }


}