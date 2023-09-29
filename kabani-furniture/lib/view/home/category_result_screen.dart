import 'package:flutter/material.dart';
import 'package:lc/constant.dart';
import 'package:lc/core/view_model/category_result_view_model.dart';
import 'package:lc/model/category.dart';
import 'package:get/get.dart';
import 'package:lc/view/home/details_screen.dart';
import 'package:lc/view/widgets/custom_text.dart';

// ignore: must_be_immutable
class CategoryResultScreen extends StatelessWidget {
  CategoryModel categoryModel;
  CategoryResultScreen({this.categoryModel});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryResultViewModel>(
      init: CategoryResultViewModel(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            categoryModel.name.toString(),
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 18,
              ),
              onPressed: () {
                Get.back();
              }),
        ),
        backgroundColor: Colors.white,
        body: GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.65),
          itemCount: controller.productModel.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(() => DetailsScreen(
                      productModel: controller.productModel[index],
                    ));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey.shade100),
                      child: Container(
                          // width: MediaQuery.of(context).size.width * .5,
                          height: 220,
                          child: Image.network(
                            controller.productModel[index].image,
                            fit: BoxFit.fitWidth,
                            width: MediaQuery.of(context).size.width * .45,
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      text: controller.productModel[index].name,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    RichText(
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        text: TextSpan(
                            style: TextStyle(color: Colors.grey.shade500),
                            text: controller.productModel[index].description)),
                    // CustomText(
                    //   text: controller.productModel[index].description,
                    //   color: Colors.grey,
                    //   alignment: Alignment.bottomLeft,
                    // ),
                    CustomText(
                      text: controller.productModel[index].price.toString() +
                          ' \$',
                      color: primaryColor,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
