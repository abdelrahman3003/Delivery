import 'package:delivery/controller/home/home_conreoller.dart';
import 'package:delivery/core/class/statuscode.dart';
import 'package:delivery/core/constant/routsApp.dart';
import 'package:delivery/data/dataSource/remote/order/request_order.dart';
import 'package:delivery/data/dataSource/remote/order/view_orders.dart';
import 'package:delivery/data/model/order_model.dart';
import 'package:get/get.dart';

import '../../core/functions/handling _data.dart';

class PendingController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  StatusRequest statusRequestApprove = StatusRequest.none;
  StatusRequest statusRequestdetails = StatusRequest.none;
  ViewOrderData viewOrderData = ViewOrderData(Get.find());
  RequestOrder requestOrder = RequestOrder(Get.find());
  List<OrderModel> pendiingOrdersList = [];
  var homeController = Get.put(HomeController());
  int? index;
  @override
  void onInit() {
    super.onInit();
    getPendingOrders();
  }

  void getPendingOrders() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await viewOrderData.pendingOrders();
    statusRequest = handlingApiData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "failure") {
        statusRequest = StatusRequest.failure;
      } else {
        List data = response["data"];
        pendiingOrdersList.addAll(data.map((e) => OrderModel.fromJson(e)));
      }
    }

    update();
  }

  void approveOrder({required int orderid, required int userid}) async {
    statusRequestApprove = StatusRequest.loading;
    update();
    var response = await requestOrder.approveOrder(orderid, userid);
    statusRequestApprove = handlingApiData(response);
    if (statusRequestApprove == StatusRequest.success) {
      if (response["status"] == "failure") {
        statusRequestApprove = StatusRequest.loading;
      } else {
        pendiingOrdersList.removeAt(index!);
        Get.rawSnackbar(
            title: "Success", message: "you have a new order , Go on");
      }
    }
    homeController.changeTabIndex(1);
    update();
  }

  goToDetails() {
    Get.toNamed(kDetailsView,
        arguments: {'orderModel': pendiingOrdersList[index!]});
  }

  refreshOrderpage() {
    pendiingOrdersList.clear();
    getPendingOrders();
    update();
  }
}
