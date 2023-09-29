import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lc/constant.dart';
import 'package:lc/view/widgets/custom_text.dart';
import 'package:lc/view/widgets/custom_text_form_field.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              CustomText(
                text: 'Billing address is the same as delivery address',
                alignment: Alignment.center,
                fontSize: 18,
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextFormField(
                text: 'Street 1',
                hint: '21, Alex Davidson Avenue',
                obscure: false,
                onsaved: (value) {},
                validator: (value) {},
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextFormField(
                text: 'Street 2',
                hint: 'Opposite Omegatron, Vicent Quarters',
                obscure: false,
                onsaved: (value) {},
                validator: (value) {},
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextFormField(
                text: 'City',
                hint: 'Victoria Island',
                obscure: false,
                onsaved: (value) {},
                validator: (value) {},
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: Get.width,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: CustomTextFormField(
                          text: 'State',
                          hint: 'Lagos State',
                          obscure: false,
                          onsaved: (value) {},
                          validator: (value) {},
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: CustomTextFormField(
                          text: 'Country',
                          hint: 'Nigeria',
                          obscure: false,
                          onsaved: (value) {},
                          validator: (value) {},
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
