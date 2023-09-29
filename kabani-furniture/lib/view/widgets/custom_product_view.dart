import 'package:flutter/material.dart';
import 'package:lc/constant.dart';
import 'package:lc/view/widgets/custom_text.dart';

class CustomProductView extends StatelessWidget {
  final String imagePath, name, price, description;
  CustomProductView({this.name, this.price, this.imagePath, this.description});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .4,
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
                  imagePath,
                  fit: BoxFit.fill,
                )),
          ),
          SizedBox(
            height: 10,
          ),
          CustomText(
            text: name,
          ),
          Expanded(
            child: CustomText(
              text: description,
              color: Colors.grey,
              alignment: Alignment.bottomLeft,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CustomText(
            text: price.toString() + ' \$',
            color: primaryColor,
          ),
        ],
      ),
    );
  }
}
