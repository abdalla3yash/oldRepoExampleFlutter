// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:erpos/controller/customer_controller.dart';
import 'package:erpos/data/base/consts.dart';
import 'package:erpos/model/product_model.dart';
import 'package:erpos/widget/fee_widget.dart';

class CustomerScreen extends StatefulWidget {
  String? price;
  CustomerScreen({required this.price});
  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<CustomerController>().getCustomerList();
  }

  var dropdownvalue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "فاتوره جديده",
          style: TextStyle(color: blackColor),
        ),
      ),
      body: GetBuilder<CustomerController>(builder: (controller) {
        return controller.isLoaded
            ? Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.02,
                    vertical: MediaQuery.of(context).size.height * 0.02),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: appColor,
                            width: 1,
                          )),
                      width: double.infinity,
                      child: DropdownButton(
                        isExpanded: true,
                        hint: const Text("يرجي اختيار العميل"),
                        items: controller.customerList.map((dropdownvalue) {
                          return DropdownMenuItem(
                            value: dropdownvalue.arTitle,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Text(dropdownvalue.arTitle),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            dropdownvalue = value;
                          });
                        },
                        value: dropdownvalue,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "المبلغ المدفوع",
                          style: TextStyle(
                              color: hintColor, fontFamily: bold, fontSize: 16),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: appColor,
                                width: 1,
                              )),
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Center(
                            child: Text(
                              widget.price!,
                              style: const TextStyle(
                                  color: blackColor,
                                  fontFamily: bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        CustomFee(
                            context: context,
                            title: "الاجمالى بدون الضريبه",
                            data: "22.5"),
                        const SizedBox(height: 10),
                        CustomFee(
                            context: context,
                            title: "الاجمالى بدون الضريبه",
                            data: "22.5"),
                        const SizedBox(height: 10),
                        CustomFee(
                            context: context,
                            title: "الاجمالى بالضريبه",
                            data: "22.5"),
                        const SizedBox(height: 10),
                        CustomFee(
                            context: context,
                            title: "اجمالي المدفوعات",
                            data: "22.5"),
                        const SizedBox(height: 10),
                        CustomFee(
                            context: context, title: "المتبقي", data: "22.5"),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: appColor,
                                  padding: const EdgeInsets.all(12)),
                              onPressed: () {},
                              child: const Text("انهاء الفاتورة",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontFamily: bold))),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: appColor,
                                  padding: const EdgeInsets.all(12)),
                              onPressed: () {},
                              child: const Text("اعادة الطباعه",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontFamily: bold))),
                        ),
                        const Spacer(),
                      ],
                    )
                  ],
                ),
              )
            : const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
