import 'package:delivery/core/class/statuscode.dart';
import 'package:delivery/data/dataSource/remote/order/view_orders.dart';
import 'package:delivery/data/model/order_model.dart';
import 'package:get/get.dart';

import '../../core/functions/handling _data.dart';

class AcceptedController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  ViewOrderData viewOrderData = ViewOrderData(Get.find());
  List<OrderModel> acceptedOrdersList = [];
  @override
  void onInit() {
    super.onInit();
    getAccedptedOrders();
  }

  void getAccedptedOrders() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await viewOrderData.acceptedOrders();
    statusRequest = handlingApiData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "failure") {
        statusRequest = StatusRequest.failure;
      } else {
        List data = response["data"];
        acceptedOrdersList.addAll(data.map((e) => OrderModel.fromJson(e)));
      }
    }
  // print("------- status = $statusRequest");
    update();
  }
}
