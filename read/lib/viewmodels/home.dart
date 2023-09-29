import 'package:read/base/model.dart';
import 'package:read/models/user.dart';
import 'package:read/services/authentication_service.dart';

import '../locator.dart';

class HomeModel extends BaseModel {
  final AuthenticationService _authService = locator<AuthenticationService>();
  User get user => _authService.user;


  checkToken(String token) async {
    print('token');
    return await _authService.checkToken(token);
  }

}
