import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lc/core/services/home_service.dart';
import 'package:lc/model/category.dart';
import 'package:lc/model/product.dart';

class HomeViewModel extends GetxController {
  List<CategoryModel> _categoruModel = [];
  List<CategoryModel> get categoryModel => _categoruModel;

  List<ProductModel> _productModel = [];
  List<ProductModel> get productModel => _productModel;

  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  HomeViewModel() {
    getCategory();
    getBestSellingProducts();
  }

  getCategory() async {
    _loading.value = true;

    await HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoruModel.add(CategoryModel.fromJson(value[i].data()));
        _loading.value = false;
      }
      update();
    });
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
