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
          child: ListView.builder(
            itemCount: controller.orderDtailsList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => OrderDetailsRow(
                item: controller.orderDtailsList[index].itemsName ?? "",
                qty: "${controller.orderDtailsList[index].itemcount ?? ""}",
                price:
                    "${controller.orderDtailsList[index].sumitemdiscountprice!} \$"),
          )),
    );
  }
}
