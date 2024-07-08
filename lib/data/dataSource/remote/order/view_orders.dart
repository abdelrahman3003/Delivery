import 'package:delivery/core/services/services.dart';
import 'package:get/get.dart';

import '../../../../core/class/crud.dart';
import '../../../../core/constant/backlinks.dart';

class ViewOrderData {
  Crud crud;
  ViewOrderData(this.crud);
  AppServices appServices = Get.find();
  pendingOrders() async {
    var response = await crud.postData(pendingOrdersNamelink, {});
    return response.fold((l) => l, (r) => r);
  }

  acceptedOrders() async {
    var response = await crud.postData(
      acceptedOrdersNamelink,
      {
        "id": appServices.sharedPreferences.getString('id'),
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
