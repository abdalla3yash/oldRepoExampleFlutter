import 'package:read/base/model.dart';
import 'package:read/models/user.dart';
import 'package:read/services/authentication_service.dart';
import '../locator.dart';

class LoginModel extends BaseModel {
  final AuthenticationService _authService = locator<AuthenticationService>();

  User get user => _authService.user;

  Future<bool> login(String email, String password) async {
    setState(ViewState.Busy);

    bool response = await _authService.login(email, password);

    notifyListeners();
    setState(ViewState.Idle);

    return response;
  }

  setToIdle() {
    notifyListeners();
    setState(ViewState.Idle);
  }
}
