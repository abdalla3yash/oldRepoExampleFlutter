import 'package:erpos/controller/home_controller.dart';
import 'package:erpos/data/base/consts.dart';
import 'package:erpos/view/cart/cart_screen.dart';
import 'package:erpos/view/customer/customer_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<HomeController>().getProductsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0.0,
          title: const Text(
            "باديا تك",
            style: TextStyle(color: blackColor),
          ),
          leading: IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: blackColor),
            onPressed: () {},
          )),
      body: GetBuilder<HomeController>(builder: (controller) {
        return controller.isLoaded
            ? ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.productList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: GestureDetector(
                        onTap: (() {
                          Get.to(
                            () => CartScreen(
                              title: controller.productList[index].title,
                              details: controller.productList[index].details,
                              price: controller.productList[index].price,
                              quentity: controller.productList[index].quantity,
                              storeId: controller.productList[index].storeId,
                            ),
                          );
                        }),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: appColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    right: MediaQuery.of(context).size.width *
                                        0.02,
                                    top: MediaQuery.of(context).size.height *
                                        0.02),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.productList[index].title,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: medium,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      controller.productList[index].details,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: regular,
                                          fontSize: 18),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02),
                                      child: Row(
                                        children: [
                                          const Text(
                                            "الكميه:",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: regular,
                                                fontSize: 18),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.02,
                                          ),
                                          Text(
                                            controller
                                                .productList[index].quantity,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontFamily: bold,
                                                fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.02,
                                    top: MediaQuery.of(context).size.height *
                                        0.04),
                                child: Column(
                                  children: [
                                    const Text(
                                      "السعر",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: regular,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01),
                                    Text(
                                      controller.productList[index].price,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: bold,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                  );
                })
            : const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
