import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lc/constant.dart';
import 'package:lc/core/view_model/cart_view_model.dart';
import 'package:lc/view/widgets/custom_text.dart';

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CartViewModel>(
        builder: (controller) => Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              height: 350,
              padding: EdgeInsets.all(20),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: controller.cartProductModel.length,
                itemBuilder: (context, index) => Container(
                  child: Container(
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150,
                          height: 180,
                          child: Image.network(
                            controller.cartProductModel[index].image,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        RichText(
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              text: controller.cartProductModel[index].name),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        CustomText(
                          color: primaryColor,
                          text:
                              '\$ ${controller.cartProductModel[index].price.toString()}',
                        ),
                      ],
                    ),
                  ),
                ),
                separatorBuilder: (context, index) {
                  return SizedBox(width: 15);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
