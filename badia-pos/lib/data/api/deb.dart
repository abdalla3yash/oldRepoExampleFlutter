import 'package:erpos/controller/auth_controller.dart';
import 'package:erpos/controller/customer_controller.dart';
import 'package:erpos/controller/home_controller.dart';
import 'package:erpos/data/api/api_client.dart';
import 'package:erpos/data/base/constant.dart';
import 'package:erpos/data/repo/auth_repo.dart';
import 'package:erpos/data/repo/customer_repo.dart';
import 'package:erpos/data/repo/home_repo.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  // local user data
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  // api client
  Get.lazyPut(() => ApiClient(
      appBaseURL: AppConstant.BASE_URL, sharedPreferences: Get.find()));

  // repos
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(
      () => HomeRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(
      () => CustomerRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  // controllers
  Get.lazyPut(() => AuthController());
  Get.lazyPut(() => HomeController(homeRepo: Get.find()));
  Get.lazyPut(() => CustomerController(customerRepo: Get.find()));
}
