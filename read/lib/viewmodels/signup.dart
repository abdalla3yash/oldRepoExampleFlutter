import 'package:read/base/model.dart';
import 'package:read/models/user.dart';
import 'package:read/services/authentication_service.dart';
import 'package:read/services/location_service.dart';
import '../locator.dart';

class SignUpModel extends BaseModel {
  final AuthenticationService _authService = locator<AuthenticationService>();
  final LocationService _locationService = locator<LocationService>();

  User get user => _authService.user;

  Future<bool> signUp(String name, String email, String password) async {
    setState(ViewState.Busy);

    bool response = await _authService.signUp(name, email, password);

    notifyListeners();
    setState(ViewState.Idle);

    return response;
  }

  Future<bool> addLocation(
      String name,
      int defualts,
      String user_id,
      String country,
      String city,
      String address,
      String pick_up_times,
      String pick_up_days,
      ) async {
    setState(ViewState.Busy);

    bool response = await _locationService.addLocation(name, defualts, user_id,
        country, city, address, pick_up_times, pick_up_days);

    notifyListeners();
    setState(ViewState.Idle);

    return response;
  }
}
