import 'package:delivery/controller/home/pending_controller..dart';
import 'package:delivery/core/class/data_handilng.dart';
import 'package:delivery/core/shared/styles.dart';
import 'package:delivery/view/home/widget/order_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PendingView extends StatelessWidget {
  const PendingView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PendingController());
    return GetBuilder<PendingController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            const Center(
              child: Text(
                "Orders",
                style: Styles.textStyle25primary,
              ),
            ),
            Expanded(
                child: DataHandlingState(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                itemCount: controller.pendiingOrdersList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => OrderCard(
                    orderModel: controller.pendiingOrdersList[index],
                    index: index),
              ),
            )),
          ],
        ),
      );
    });
  }
}
