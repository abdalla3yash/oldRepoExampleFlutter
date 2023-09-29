import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../data/base/consts.dart';

class AuthController extends GetxController {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  Future login(String username, String password) async {
    var body = {
      'username': usernameController.text,
      'password': passwordController.text
    };

    var response = await http.post(
      Uri.parse(AppConstant.BASE_URL + AppConstant.LOGIN_URL),
      body: json.decode(json.encode(body)),
    );
    if (response.statusCode == 200) {
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      saveToken(extractedData['data']['token'].toString());
    }
  }

  saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  Future<String> getUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppConstant.TOKEN) ?? "None";
  }
}
