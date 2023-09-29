import 'package:get/get.dart';
import 'package:lc/core/view_model/auth_view_model.dart';
import 'package:lc/core/view_model/cart_view_model.dart';
import 'package:lc/core/view_model/category_result_view_model.dart';
import 'package:lc/core/view_model/checkout_view_model.dart';
import 'package:lc/core/view_model/controll_view_model.dart';
import 'package:lc/core/view_model/home_view_model.dart';
import 'package:lc/helper/local_storage_data.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControllViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => LocalStorageData());
    Get.lazyPut(() => CheckoutViewModel());
    Get.lazyPut(() => CategoryResultViewModel());
  }
}
