import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:read/models/location.dart';
import 'package:read/models/person.dart';
import 'package:read/models/user.dart';

class Api {
  var client = new http.Client();
  User _authenticatedUser;


  Future<User> login(String email, String password) async {
    final http.Response response = await http.post(
        "http://192.168.1.4/project/public/api/login",
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
        body:
            jsonEncode(<String, String>{'email': email, 'password': password}));

    if (response.statusCode != 200) {
      Map ref = json.decode(response.body);
      return throw Exception(ref['error'].toString());
    }

    return User.fromJson(json.decode(response.body));
  }

  Future<User> signup(String name, String email, String password) async {
    final http.Response response = await http.post(
        "http://192.168.1.4/project/public/api/register",
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'name': name,
          'email': email,
          'password': password,
        }));

    if (response.statusCode != 200) {
      Map ref = json.decode(response.body);
      return throw Exception(ref['error'].toString());
    }

    return User.fromJson(json.decode(response.body));
  }

  Future<Location> addLocation(
      String name,
      int defualts,
      String user_id,
      String country,
      String city,
      String address,
      String pick_up_times,
      String pick_up_days,
      ) async {
    final http.Response response =
        await http.post("http://localhost/project/public/api/locations",
            headers: <String, String>{
              // HttpHeaders.authorizationHeader: 'Bearer ${_authenticatedUser.token}',
              'Content-type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(
              <String, String>{
                'name': name,
                'defualt': defualts as String,
                'user_id' :_authenticatedUser.id,
                'country': country,
                'city':city,
                'address':address,
                'pick_up_times':pick_up_times,
                'pick_up_days': pick_up_days,
              },
            ));

    if (response.statusCode != 200) {
      Map ref = json.decode(response.body);
      return throw Exception(ref['error'].toString());
    }

    return Location.fromJson(json.decode(response.body));
  }


  userDetails(String token, int user_id) async {
    final http.Response response = await http.post("http://localhost/project/public/api/details",
        headers: <String, String>{
        HttpHeaders.authorizationHeader: 'Bearer $token',
        'Content-type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 200) {
      Map ref = json.decode(response.body);
      return throw Exception(ref['error'].toString());
    }
    return Person.fromJson(json.decode(response.body));
  }




  checkToken(String token) async {
    Uri uri =
        Uri.https("http://192.168.1.4/project/public/api/", 'token-check');
    final http.Response response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{'token': token}));
    print(response.body);
    return jsonDecode(response.body);
  }
}
