import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/class/statuscode.dart';
import '../../core/functions/handling _data.dart';
import '../../data/dataSource/remote/order/view_orders.dart';
import '../../data/model/order_details_model.dart';
import '../../data/model/order_model.dart';

class DetailsController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;
  ViewOrderData viewOrderData = ViewOrderData(Get.find());
  Completer<GoogleMapController>? completerController;
  CameraPosition? kGooglePlex;
  OrderModel? orderModel;
  List<OrderDetailsModel> orderDtailsList = [];
  @override
  void onInit() async {
    orderModel = await Get.arguments['orderModel'];
    await getCurrentPosition();
    detailsOrder();
    super.onInit();
  }

  getCurrentPosition() async {
    completerController = Completer<GoogleMapController>();
    kGooglePlex = CameraPosition(
      target: LatLng(orderModel!.addressLat!.toDouble(),
          orderModel!.addressLong!.toDouble()),
      zoom: 14.4746,
    );
  }

  void detailsOrder() async {
    var response =
        await viewOrderData.detailsorder(orderid: orderModel!.ordersId);
    statusRequest = handlingApiData(response);

    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "failure") {
      } else {
        List data = response["data"];
        orderDtailsList.addAll(data.map((e) => OrderDetailsModel.fromJson(e)));
      }
    }
    update();
  }
}
