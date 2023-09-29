import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lc/core/services/database/cart_database_helper.dart';
import 'package:lc/model/cart_product_model.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;

  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CartProductModel> _cartProductModel = [];
  List<CartProductModel> get cartProductModel => _cartProductModel;
  var dbHelper = CartDatabaseHelper.db;

  double get totalPrice => _totalPrice;
  double _totalPrice = 0.0;

  CartViewModel() {
    getAllProduct();
  }

  getAllProduct() async {
    _loading.value = true;
    _cartProductModel = await dbHelper.getAllProducts();
    print(_cartProductModel.length);
    _loading.value = false;
    getTotalPrice();
    update();
  }

  addProduct(CartProductModel model) async {
    for (int i = 0; i < _cartProductModel.length; i++) {
      if (_cartProductModel[i].productId == model.productId) {
        return;
      }
    }
    await dbHelper.insert(model);
    _cartProductModel.add(model);
    _totalPrice += (double.parse(model.price) * model.quentity);
    update();
  }

  getTotalPrice() {
    for (int i = 0; i < _cartProductModel.length; i++) {
      _totalPrice += (double.parse(_cartProductModel[i].price) *
          _cartProductModel[i].quentity);
      update();
    }
  }

  deleteProduct(CartProductModel model) async {
    await dbHelper.deleteProduct(model);
    _cartProductModel.remove(model);
    _totalPrice -= (double.parse(model.price) * model.quentity);
    _cartProductModel = await dbHelper.getAllProducts();
    update();
  }

  increaseQuentity(int index) async {
    _cartProductModel[index].quentity++;
    _totalPrice += double.parse(_cartProductModel[index].price);
    await dbHelper.updateProduct(_cartProductModel[index]);
    update();
  }

  decreaseQuentity(int index) async {
    if (_cartProductModel[index].quentity == 1) {
      return;
    }
    _cartProductModel[index].quentity--;
    _totalPrice -= double.parse(_cartProductModel[index].price);
    await dbHelper.updateProduct(_cartProductModel[index]);
    update();
  }
}
