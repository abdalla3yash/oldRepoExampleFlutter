import 'dart:convert';

import 'package:erpos/data/api/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../base/consts.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({
    required this.apiClient,
    required this.sharedPreferences,
  });

  Future<Response> login(String username, String password) async {
    print("repooooo " + username);
    print("repooo " + password);

    return await apiClient.postData(
        AppConstant.LOGIN_URL, {"username": username, "password": password});
  }

  bool userLoggedIn() {
    return sharedPreferences.containsKey(AppConstant.TOKEN);
  }

  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeaders(token);
    return await sharedPreferences.setString(AppConstant.TOKEN, token);
  }

  Future<String> getUserToken() async {
    return sharedPreferences.getString(AppConstant.TOKEN) ?? "None";
  }

  bool clearSharedData() {
    sharedPreferences.remove(AppConstant.TOKEN);
    sharedPreferences.remove(AppConstant.PASSWORD);
    apiClient.token = '';
    apiClient.updateHeaders('');
    return true;
  }
}
