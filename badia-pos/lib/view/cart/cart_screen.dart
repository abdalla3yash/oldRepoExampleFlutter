import 'package:erpos/controller/cart_controller.dart';
import 'package:erpos/data/base/consts.dart';
import 'package:erpos/view/customer/customer_screen.dart';
import 'package:flutter/services.dart';

class CartScreen extends StatelessWidget {
  var controller = Get.put(CartController());

  String? title, details, price, quentity, storeId;

  CartScreen(
      {super.key,
      required this.title,
      required this.details,
      required this.price,
      required this.quentity,
      required this.storeId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "فاتوره جديده",
            style: TextStyle(color: blackColor),
          ),
        ),
        body: Obx(
          () => Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.height * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title!,
                  style: const TextStyle(
                      color: blackColor, fontSize: 24, fontFamily: medium),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      "الكميه: ",
                      style: TextStyle(
                          color: hintColor, fontSize: 18, fontFamily: regular),
                    ),
                    Text(
                      quentity.toString(),
                      style: const TextStyle(
                          color: blackColor, fontSize: 20, fontFamily: medium),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      "السعر: ",
                      style: TextStyle(
                          color: hintColor, fontSize: 18, fontFamily: regular),
                    ),
                    Text(
                      price.toString(),
                      style: const TextStyle(
                          color: blackColor, fontSize: 20, fontFamily: medium),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: controller.bayController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    hintText: "المبلغ المدفوع",
                    hintStyle: TextStyle(fontFamily: light, color: hintColor),
                    fillColor: Colors.white,
                    filled: true,
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: appColor),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.increaseQuentity(
                            // int.parse(quentity!)
                            );
                        controller.calculateTotalPrice(double.parse(price!));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.08,
                        height: MediaQuery.of(context).size.width * 0.08,
                        decoration: BoxDecoration(
                          color: appColor,
                          borderRadius: BorderRadius.circular(
                            25,
                          ),
                        ),
                        child: const Center(
                            child: Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                      ),
                    ),
                    Text(controller.quentity.toString(),
                        style: TextStyle(
                            color: appColor,
                            fontSize: 20,
                            fontFamily: extrabold)),
                    GestureDetector(
                      onTap: () {
                        controller.decreaseQuentity();
                        controller.calculateTotalPrice(double.parse(price!));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.08,
                        height: MediaQuery.of(context).size.width * 0.08,
                        decoration: BoxDecoration(
                          color: appColor,
                          borderRadius: BorderRadius.circular(
                            25,
                          ),
                        ),
                        child: const Center(
                            child: Icon(
                          Icons.remove,
                          color: Colors.white,
                        )),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                      vertical: MediaQuery.of(context).size.height * 0.05),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "الاجمالي: ",
                        style: TextStyle(
                            color: hintColor,
                            fontSize: 18,
                            fontFamily: regular),
                      ),
                      Text(
                        controller.totalPrice.toString(),
                        style: const TextStyle(
                            color: blackColor,
                            fontSize: 20,
                            fontFamily: medium),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: appColor, padding: const EdgeInsets.all(16)),
                      onPressed: () {
                        Get.to(() => CustomerScreen(
                              price: controller.bayController.text,
                            ));
                      },
                      child: const Text("متابعه",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: bold))),
                )
              ],
            ),
          ),
        ));
  }
}
