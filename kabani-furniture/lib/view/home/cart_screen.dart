import 'package:flutter/material.dart';
import 'package:flutter_svg/parser.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lc/constant.dart';
import 'package:lc/core/view_model/cart_view_model.dart';
import 'package:lc/model/cart_product_model.dart';
import 'package:lc/view/checkout/checkout_screen.dart';
import 'package:lc/view/widgets/custom_button.dart';
import 'package:lc/view/widgets/custom_text.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      init: Get.find(),
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        body: controller.cartProductModel.length == 0
            ? emptyCard()
            : Column(
                children: [
                  Expanded(
                    child: Container(
                      child: Container(
                        child: ListView.separated(
                          itemCount: controller.cartProductModel.length,
                          itemBuilder: (context, index) {
                            return Dismissible(
                              key: UniqueKey(),
                              confirmDismiss: (direction) async {
                                if (direction == DismissDirection.endToStart) {
                                  Get.bottomSheet(Container(
                                    height: 150,
                                    padding: EdgeInsets.all(8),
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        CustomText(
                                          text:
                                              'Are you Sure to remve this product from your Cart?',
                                          fontSize: 20,
                                          alignment: Alignment.center,
                                          color: Colors.grey.shade700,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  child: CustomButton(
                                                    onpressed: () {
                                                      Get.back();
                                                    },
                                                    text: 'CANCEL',
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  child: CustomButton(
                                                    color: deleteColor,
                                                    onpressed: () async {
                                                      await controller
                                                          .deleteProduct(
                                                        CartProductModel(
                                                            name: controller
                                                                .cartProductModel[
                                                                    index]
                                                                .name,
                                                            price: controller
                                                                .cartProductModel[
                                                                    index]
                                                                .price,
                                                            image: controller
                                                                .cartProductModel[
                                                                    index]
                                                                .image,
                                                            productId: controller
                                                                .cartProductModel[
                                                                    index]
                                                                .productId,
                                                            quentity: controller
                                                                .cartProductModel[
                                                                    index]
                                                                .quentity),
                                                      );
                                                      Get.back();
                                                    },
                                                    text: 'DELETE',
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ));
                                }
                                if (direction == DismissDirection.startToEnd) {
                                  Get.snackbar('Add Your Wislist',
                                      'This tool is not activated now, Stay Tuned',snackPosition: SnackPosition.BOTTOM);
                                }
                              },
                              secondaryBackground: Container(
                                color: deleteColor,
                                alignment: Alignment.centerRight,
                                child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Image.asset(
                                      'assets/images/Icon_Delete.png',
                                      height: 30,
                                      width: 30,
                                      fit: BoxFit.contain,
                                    )),
                              ),
                              background: Container(
                                color: favColor,
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Image.asset(
                                      'assets/images/Icon_Wishlist.png',
                                      height: 25,
                                      width: 25,
                                      fit: BoxFit.contain,
                                    )),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  height: 140,
                                  child: Row(
                                    children: [
                                      Container(
                                          width: 140,
                                          child: Image.network(
                                            controller
                                                .cartProductModel[index].image,
                                            fit: BoxFit.fill,
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              fontSize: 24,
                                              text: controller
                                                  .cartProductModel[index].name,
                                            ),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            CustomText(
                                              color: primaryColor,
                                              text:
                                                  '\$ ${controller.cartProductModel[index].price.toString()}',
                                            ),
                                            SizedBox(
                                              height: 25,
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              color: Colors.grey.shade300,
                                              width: 140,
                                              height: 40,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  GestureDetector(
                                                      onTap: () => controller
                                                          .increaseQuentity(
                                                              index),
                                                      child: Icon(Icons.add)),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  CustomText(
                                                    alignment: Alignment.center,
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                    text: controller
                                                        .cartProductModel[index]
                                                        .quentity
                                                        .toString(),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () => controller
                                                        .decreaseQuentity(
                                                            index),
                                                    child: Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 20),
                                                        child: Icon(
                                                            Icons.minimize)),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 15,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, bottom: 15, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            GetBuilder<CartViewModel>(
                              init: Get.find(),
                              builder: (controller) => CustomText(
                                text: '\$ ${controller.totalPrice}',
                                fontSize: 22,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            CustomText(
                              text: '\$' + 'TOTAL',
                              color: primaryColor,
                              fontSize: 18,
                            ),
                          ],
                        ),
                        Container(
                          width: 170,
                          child: CustomButton(
                            onpressed: () {
                              Get.to(() => CheckoutScreen());
                            },
                            text: 'CHECKOUT',
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

  Widget emptyCard() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/images/card_empty.svg',
          width: 200,
          height: 200,
        ),
        SizedBox(
          height: 20,
        ),
        CustomText(
          text: 'Cart Empty',
          color: Colors.grey.shade700,
          fontSize: 24,
          alignment: Alignment.center,
        )
      ],
    );
  }
}
