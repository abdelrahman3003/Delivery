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
        Row(children: [
          const TextItem(tilte: "Order Number", subtilte: " 200"),
          const Spacer(),
          Card(
            child:
                //  controller.statusRequest2 == StatusRequest.loading &&
                //         controller.orderDeleted == index
                //     ? const CircularProgressIndicator()
                //     :

                OnboardingButton(
              text: "Delete",
              onPressed: () {
                // controller.deleteOrder(index);
              },
              width: Get.width / 5,
              color: Colors.white,
              textColor: Colors.red,
            ),
          )
        ]),
        TextItem(
            tilte: "Order date",
            subtilte: " ${Jiffy.parse(orderModel.ordersDatetime!).fromNow()}"),
        TextItem(
          tilte: "Order Type ",
          subtilte: orderModel.ordersType == 0 ? "Receive" : "Delivery",
        ),
        TextItem(
            tilte: "Order Price", subtilte: " ${orderModel.ordersPrice} \$"),
        "${orderModel.ordersDatetime}" == "Receive"
            ? const SizedBox()
            : TextItem(
                tilte: "Delivery Price",
                subtilte: " ${orderModel.ordersPricedelivery} \$"),
        TextItem(
          tilte: "Payment Method ",
          subtilte:
              orderModel.ordersPaymentmethod == 0 ? "On Delivery" : "On Card",
        ),
        Row(
          children: [
            const TextItem(tilte: "Order Status", subtilte: 'Order Status'
                //controller.printOrderStatus(orderStatus)
                ),
            const SizedBox(width: 20),
            //  orderStatus == 4
            //    ?
            InkWell(
              onTap: () {
                //  showratingDialog(context, orderid);
              },
              child: Card(
                  child: Text("  Rate  ",
                      style: Styles.textStyle20black.copyWith(
                          color: Colors.green, fontWeight: FontWeight.bold))),
            )
            // : const SizedBox()
          ],
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
            SizedBox(
                width: Get.width / 4,
                child: OnboardingButton(
                    text: "Details",
                    onPressed: () {
                      // controller.goToOrederDetails(orderModel);
                    }))
          ],
        ),
        const SizedBox(height: 5),
        const Divider(color: Colors.grey, thickness: 1.5),
      ]),
    );
  }
}
