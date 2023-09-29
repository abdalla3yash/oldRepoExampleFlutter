import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lc/constant.dart';
import 'package:lc/core/services/home_service.dart';
import 'package:lc/core/view_model/controll_view_model.dart';
import 'package:lc/core/view_model/home_view_model.dart';
import 'package:lc/view/home/category_result_screen.dart';
import 'package:lc/view/home/details_screen.dart';
import 'package:lc/view/widgets/custom_product_view.dart';
import 'package:lc/view/widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.only(top: 60, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _searchTextFormField(),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: 'Categories',
                ),
                SizedBox(
                  height: 20,
                ),
                _listViewCategory(),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Best Silling',
                      fontSize: 18,
                    ),
                    CustomText(
                      text: 'See All',
                      fontSize: 16,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                _listViewProducts(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Colors.grey.shade200),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            )),
      ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Container(
              height: 100,
              child: ListView.separated(
                itemCount: controller.categoryModel.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(
                        CategoryResultScreen(
                            categoryModel: controller.categoryModel[index]),
                      );
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.grey.shade100),
                            height: 60,
                            width: 60,
                            child: Image.network(
                                controller.categoryModel[index].image),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Text(controller.categoryModel[index].name),
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  width: 20,
                ),
              ),
            ),
    );
  }

  Widget _listViewProducts() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 350,
        child: ListView.separated(
          itemCount: controller.productModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(DetailsScreen(
                    productModel: controller.productModel[index]));
              },
              child: CustomProductView(
                imagePath: controller.productModel[index].image,
                name: controller.productModel[index].name,
                price: controller.productModel[index].price,
                description: controller.productModel[index].description,
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }
}
