import 'package:delivery/controller/home/details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'address_card.dart';
import 'card_order_details.dart';
import 'shiping_address_card.dart';

class OrederDetailsViewBody extends GetView<DetailsController> {
  const OrederDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const CardOrderDetails(),
        ShippingAddressCard(
            address:
                "${controller.orderModel!.addressCity}, ${controller.orderModel!.addressStreet}"),
        const AddressCard(),
      ],
    );
  }
}
