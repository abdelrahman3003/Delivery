import 'package:delivery/controller/home/details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'order_row_details.dart';

class OrderDetailsList extends GetView<DetailsController> {
  const OrderDetailsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Opacity(
          opacity: .6,
          child: OrderDetailsRow(
              item: controller.orderDtailsList[0].itemsName ?? "",
              qty: "${controller.orderDtailsList[0].itemcount ?? ""}",
              price:
                  "${controller.orderDtailsList[0].sumitemdiscountprice!} \$")),
    );
  }
}
