import 'package:shop_app/modules/shop_app/shop_login_model.dart';

abstract class ShopLoginStates {}

class ShopLoginInitState extends ShopLoginStates {}

class ShopLoginLoadState extends ShopLoginStates {}

class ShopLoginSuccessState extends ShopLoginStates {
  final ShopLoginModel shopModel;
  ShopLoginSuccessState(this.shopModel);
}

class ShopLoginErrorState extends ShopLoginStates {
  final String error;

  ShopLoginErrorState(this.error);
}

class ShopChangePasswordVisibilityState extends ShopLoginStates {}
