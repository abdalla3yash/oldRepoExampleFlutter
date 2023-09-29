import 'package:get_it/get_it.dart';
import 'package:read/services/api.dart';
import 'package:read/services/authentication_service.dart';
import 'package:read/services/location_service.dart';
import 'package:read/services/user_service.dart';
import 'package:read/viewmodels/home.dart';
import 'package:read/viewmodels/login.dart';
import 'package:read/viewmodels/person_details.dart';
import 'package:read/viewmodels/signup.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => PersonService());
  locator.registerLazySingleton(() => LocationService());
  locator.registerFactory(() => LoginModel());
  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => SignUpModel());
  locator.registerFactory(() => PersonViewModel());

}
