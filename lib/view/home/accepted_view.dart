import 'package:delivery/controller/home/accepted_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../core/class/data_handilng.dart';
import '../../core/class/statuscode.dart';
import '../../core/shared/styles.dart';
import 'widget/order_card.dart';

class AcceptedView extends StatelessWidget {
  const AcceptedView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AcceptedController());
    return GetBuilder<AcceptedController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            const Center(
              child: Text(
                "Accepting Orders",
                style: Styles.textStyle25primary,
              ),
            ),
            Expanded(
                child: DataHandlingState(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                itemCount: controller.acceptedOrdersList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => OrderCard(
                  isLoadingApprove:
                      controller.statusRequestdone == StatusRequest.loading &&
                          controller.index == index,
                  orderModel: controller.acceptedOrdersList[index],
                  onPressedApprove: () {
                    controller.index = index;
                    controller.doneOrder(
                        orderid: controller.acceptedOrdersList[index].ordersId!,
                        userid:
                            controller.acceptedOrdersList[index].ordersUserid!);
                  },
                  onPressedetials: () {
                    controller.index = index;
                    controller.goToDetails();
                  },
                ),
              ),
            )),
          ],
        ),
      );
    });
  }
}
