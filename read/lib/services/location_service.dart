import 'dart:convert';

import 'package:read/models/location.dart';
import 'package:read/models/user.dart';
import '../locator.dart';
import 'api.dart';

class LocationService {
  Api _api = locator<Api>();
  List<Location> _courses;
  List<Location> get courses => _courses;
  User _authenticatedUser;

  Future addLocation(
      String name,
      int defualts,
      String user_id,
      String country,
      String city,
      String address,
      String pick_up_times,
      String pick_up_days,) async {
    try {
      Location course = await _api.addLocation(name, defualts, user_id, country,
          city, address, pick_up_times, pick_up_days);
      _courses.add(course);
      return true;
    } catch (Exception) {
      return false;
    }
  }








}
