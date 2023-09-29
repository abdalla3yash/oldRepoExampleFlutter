import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lc/constant.dart';
import 'package:lc/core/view_model/cart_view_model.dart';
import 'package:lc/model/cart_product_model.dart';
import 'package:lc/model/product.dart';
import 'package:lc/view/widgets/custom_button.dart';
import 'package:lc/view/widgets/custom_text.dart';

class DetailsScreen extends StatelessWidget {
  ProductModel productModel;
  DetailsScreen({this.productModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: Image.network(
                productModel.image,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(14),
                  child: Column(
                    children: [
                      CustomText(
                        text: productModel.name,
                        fontSize: 26,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.all(12),
                            width: MediaQuery.of(context).size.width * .4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(
                                  text: 'Size',
                                ),
                                CustomText(
                                  text: productModel.size,
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            width: MediaQuery.of(context).size.width * .4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(
                                  text: 'Color',
                                ),
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(8),
                                      color: productModel.color),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: 'Details',
                        color: Colors.black,
                        fontSize: 24,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: productModel.description,
                        fontSize: 18,
                        height: 1.7,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(
                  left: 30, right: 30, bottom: 15, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomText(
                        text: 'PRICE',
                        fontSize: 22,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomText(
                        text: '\$' + productModel.price,
                        color: primaryColor,
                        fontSize: 18,
                      ),
                    ],
                  ),
                  GetBuilder<CartViewModel>(
                    init: CartViewModel(),
                    builder: (controller) => Container(
                      width: 170,
                      child: CustomButton(
                        onpressed: () => controller.addProduct(CartProductModel(
                            name: productModel.name,
                            price: productModel.price,
                            image: productModel.image,
                            productId: productModel.productId,
                            quentity: 1)),
                        text: 'ADD',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
