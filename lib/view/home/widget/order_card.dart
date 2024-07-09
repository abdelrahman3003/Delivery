import 'package:delivery/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../core/shared/styles.dart';
import '../../../core/shared/widgets/buttons/onboarding_Button.dart';
import '../../../data/model/order_model.dart';
import 'text_item.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.orderModel,
    required this.index,
  });

  final OrderModel orderModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Row(children: [
          TextItem(tilte: "Order Number", subtilte: " 200"),
        ]),
        TextItem(
            tilte: "Order date",
            subtilte: " ${Jiffy.parse(orderModel.ordersDatetime!).fromNow()}"),
        TextItem(
          tilte: "Payment Method ",
          subtilte:
              orderModel.ordersPaymentmethod == 0 ? "On Delivery" : "On Card",
        ),
        TextItem(
          tilte: "Delivery Price ",
          subtilte: '${orderModel.ordersPricedelivery} \$',
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: Text(
                "Totla Price:  200 \$",
                style: Styles.textStyle20
                    .copyWith(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor:
                    const WidgetStatePropertyAll(ColorsApp.kprimaryColor1),
                shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              child: Text(
                "Details",
                style: Styles.textStyle16.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 5),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: const WidgetStatePropertyAll(Colors.green),
                shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              child: Text(
                "Accepet",
                style: Styles.textStyle16.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        const Divider(color: Colors.grey, thickness: 1.5),
      ]),
    );
  }
}
