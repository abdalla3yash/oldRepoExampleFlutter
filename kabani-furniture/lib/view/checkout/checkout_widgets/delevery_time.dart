import 'package:flutter/material.dart';
import 'package:lc/constant.dart';
import 'package:lc/helper/enum.dart';
import 'package:lc/view/widgets/custom_text.dart';

class DeliveryTime extends StatefulWidget {
  @override
  _DeliveryTimeState createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
  Delivery delivery = Delivery.StandardDelivery;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          RadioListTile<Delivery>(
            value: Delivery.StandardDelivery,
            groupValue: delivery,
            onChanged: (Delivery value) {
              setState(() {
                delivery = value;
              });
            },
            title: CustomText(
              text: 'Standard Delivery',
              fontSize: 20,
            ),
            subtitle: CustomText(
              text: '\nOrder will be delivered between 3 - 5 business days',
              color: Colors.grey.shade700,
            ),
            activeColor: primaryColor,
          ),
          SizedBox(
            height: 40,
          ),
          RadioListTile<Delivery>(
            value: Delivery.NextDayDelivery,
            groupValue: delivery,
            onChanged: (Delivery value) {
              setState(() {
                delivery = value;
              });
            },
            title: CustomText(
              text: 'Next Day Delivery',
              fontSize: 20,
            ),
            subtitle: CustomText(
              text:
                  '\nPlace your order before 6pm and your items will be delivered the next day',
              color: Colors.grey.shade700,
            ),
            activeColor: primaryColor,
          ),
          SizedBox(
            height: 40,
          ),
          RadioListTile<Delivery>(
            value: Delivery.NominatedDelivery,
            groupValue: delivery,
            onChanged: (Delivery value) {
              setState(() {
                delivery = value;
              });
            },
            title: CustomText(
              text: 'Nominated Delivery',
              fontSize: 20,
            ),
            subtitle: CustomText(
              text:
                  '\nPick a particular date from the calendar and order will be delivered on selected date',
              color: Colors.grey.shade700,
            ),
            activeColor: primaryColor,
          )
        ],
      ),
    );
  }
}
