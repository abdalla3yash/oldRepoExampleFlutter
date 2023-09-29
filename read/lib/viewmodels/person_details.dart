
import 'package:read/base/model.dart';
import 'package:read/models/person.dart';
import 'package:read/services/user_service.dart';

import '../locator.dart';

class PersonViewModel extends BaseModel {
  PersonService _ps = locator<PersonService>();
  Person _person;
  Person get person => _person;

  Future<bool> professorDetails(String token, int user_id) async {
    setState(ViewState.Busy);
    bool success = true;
    try {
      _person = await _ps.userDetails(token, user_id);
    } catch (Exception) {
      success = false;
    }

    setState(ViewState.Idle);

    return success;
  }

}
