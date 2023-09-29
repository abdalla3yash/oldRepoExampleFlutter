import 'package:flutter/material.dart';
import 'package:read/models/user.dart';
import '../locator.dart';
import 'api.dart';

class AuthenticationService with ChangeNotifier {
  Api _api = locator<Api>();
  User user;

  Future<bool> login(String email, String password) async {
    try {
      User fetchedUser = await _api.login(email, password);
      user = fetchedUser;
      return true;
    } catch (Exception) {
      notifyListeners();
      return false;
    }
  }

  Future<bool> signUp(String name, String email, String password) async {
    User newUser = await _api.signup(name, email, password);

    bool hasUser = newUser != null;

    if (hasUser) {
      user = newUser;
    }
    return hasUser;
  }

  checkToken(String token) async {
    var res = await _api.checkToken(token);
    print(token);
    return res;
  }
}
