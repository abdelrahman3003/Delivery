import 'package:delivery/core/class/statuscode.dart';
import 'package:delivery/data/dataSource/remote/order/view_orders.dart';
import 'package:delivery/data/model/order_model.dart';
import 'package:get/get.dart';
import '../../core/constant/routsApp.dart';
import '../../core/functions/handling _data.dart';
import '../../data/dataSource/remote/order/request_order.dart';
import 'home_conreoller.dart';

class AcceptedController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  ViewOrderData viewOrderData = ViewOrderData(Get.find());
  List<OrderModel> acceptedOrdersList = [];
  StatusRequest statusRequestdone = StatusRequest.none;
  StatusRequest statusRequestdetails = StatusRequest.none;
  RequestOrder requestOrder = RequestOrder(Get.find());
  var homeController = Get.put(HomeController());

  int? index;
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
    update();
  }

  void doneOrder({required int orderid, required int userid}) async {
    statusRequestdone = StatusRequest.loading;
    update();
    var response = await requestOrder.doneOrder(
      acceptedOrdersList[index!].ordersId!,
      acceptedOrdersList[index!].ordersId!,
    );
    statusRequestdone = handlingApiData(response);
    if (statusRequestdone == StatusRequest.success) {
      if (response["status"] == "failure") {
        statusRequestdone = StatusRequest.loading;
      } else {
        acceptedOrdersList.removeAt(index!);
        Get.rawSnackbar(
            title: "archieved",
            message: "this order is succesfully archeived , Go on");
      }
    }
    update();
  }

  goToDetails() {
    Get.toNamed(kDetailsView,
        arguments: {'orderModel': acceptedOrdersList[index!]});
    update();
  }
}
