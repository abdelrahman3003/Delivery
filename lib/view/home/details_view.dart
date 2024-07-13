import 'package:delivery/core/class/data_handilng.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home/details_controller.dart';
import '../../core/shared/styles.dart';
import 'widget/order_details_view/address_card.dart';
import 'widget/order_details_view/card_order_details.dart';
import 'widget/order_details_view/shiping_address_card.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DetailsController());
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GetBuilder<DetailsController>(
          builder: (controller) => DataHandlingState(
              statusRequest: controller.statusRequest,
              widget: Column(
                children: [
                  const Center(
                    child: Text(
                      "Order Details",
                      style: Styles.textStyle25primary,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const CardOrderDetails(),
                  if (controller.orderModel != null)
                    ShippingAddressCard(
                        address:
                            "${controller.orderModel!.addressCity}, ${controller.orderModel!.addressStreet}"),
                  const AddressCard(),
                ],
              ))),
    )));
  }
}
