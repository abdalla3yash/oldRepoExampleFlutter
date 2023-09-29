import 'dart:ffi';

import 'package:erpos/data/base/consts.dart';

class CartController extends GetxController {
  var isLoading = false.obs;
  RxDouble totalPrice = 0.0.obs;
  var quentity = 0.obs;
  var bayController = TextEditingController();

  increaseQuentity(
      // totalQuentity
      ) {
    // if (quentity.value < totalQuentity) {

    // }

    quentity.value++;
  }

  decreaseQuentity() {
    if (quentity.value > 0) {
      quentity.value--;
    }
  }

  calculateTotalPrice(price) {
    totalPrice.value = price.toDouble() * quentity.value;
  }
}
