import 'package:read/models/person.dart';

import '../locator.dart';
import 'api.dart';

class PersonService {
  Api _api = locator<Api>();

  Future<Person> userDetails(
      String token, int user_id) async {
    return await _api.userDetails( token, user_id);
  }


}
