import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:erpos/data/base/constant.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseURL;
  SharedPreferences sharedPreferences;
  late Map<String, String> _mainHeaders;
  Map<String, String> get headers => _mainHeaders;

  ApiClient({required this.appBaseURL, required this.sharedPreferences}) {
    baseUrl = appBaseURL;
    timeout = const Duration(seconds: 30);
    token = sharedPreferences.getString(AppConstant.TOKEN) ?? "";
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization':
          'Bearer ${sharedPreferences.getString(AppConstant.TOKEN)}',
    };
  }

  Future<Response> getData(
    String uri, {
    Map<String, String>? headers,
  }) async {
    try {
      Response response = await get(uri, headers: headers ?? _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  void updateHeaders(String token) {
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Response> postData(
    var uri,
    var body, {
    Map<String, String>? headers,
  }) async {
    try {
      Response response = await post(uri, json.decode(json.encode(body)),
          headers: _mainHeaders);

      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
