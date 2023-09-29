import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lc/core/services/home_service.dart';
import 'package:lc/model/product.dart';

class CategoryResultViewModel extends GetxController {
  List<ProductModel> _productModel = [];
  List<ProductModel> get productModel => _productModel;

  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  CategoryResultViewModel() {
    getBestSellingProducts();
  }

  getBestSellingProducts() async {
    _loading.value = true;
    await HomeService().getBestSelling().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(ProductModel.fromJson(value[i].data()));
        _loading.value = false;
      }
      update();
    });
  }
}
