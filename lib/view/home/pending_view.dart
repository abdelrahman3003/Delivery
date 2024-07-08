import 'package:delivery/data/model/order_model.dart';
import 'package:delivery/view/home/widget/order_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PendingView extends StatelessWidget {
  const PendingView({super.key});

  @override
  Widget build(BuildContext context) {
    return OrderCard(orderModel: OrderModel(), index: 0);
  }
}
