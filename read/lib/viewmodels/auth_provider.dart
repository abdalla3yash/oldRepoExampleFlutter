import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  String _token;
  String _name;
  bool _loggedIn = false;
  bool _seen = false;

  AuthProvider() {
    _read();
  }

  get name => _name;
  get loggedIn => _loggedIn;
  get token => _token;
  get seen => _seen;


  void setLoggedIn(String name, String token) {
    _loggedIn = true;
    _seen = true;
    _name = name;
    _token = token;
    _save();
    notifyListeners();
  }

  logout() {
    _loggedIn = false;
    _seen = false;
    _save();
    notifyListeners();
  }

  _read() async {
    final prefs = await SharedPreferences.getInstance();
    bool loggedIn = prefs.getBool('loggedIn') ?? false;
    bool seen = prefs.getBool('seen') ?? false;
    String token = prefs.getString('token') ?? "";
    String name = prefs.getString('name') ?? "";

    if (loggedIn) {
      _loggedIn = loggedIn;
      _seen = seen;
      _token = token;
      _name = name;
      notifyListeners();
    }
  }

  _save() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('loggedIn', _loggedIn);
    prefs.setBool('seen', _seen);
    prefs.setString('token', _token);
    prefs.setString('name', _name);
  }
}
