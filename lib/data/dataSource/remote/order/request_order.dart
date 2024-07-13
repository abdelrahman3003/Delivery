import 'package:get/get.dart';

import '../../../../core/class/crud.dart';
import '../../../../core/constant/backlinks.dart';
import '../../../../core/services/services.dart';

class RequestOrder {
  Crud crud;
  RequestOrder(this.crud);
  AppServices appServices = Get.find();
  approveOrder(int orderid, int userid) async {
    var response = await crud.postData(apporveOrderNamelink, {
      "orderid": orderid.toString(),
      "userid": userid.toString(),
      "deliveryid": appServices.sharedPreferences.getString('id')
    });
    return response.fold((l) => l, (r) => r);
  }

  doneOrder(int orderid, int userid) async {
    var response = await crud.postData(doneOrderNamelink, {
      "orderid": orderid.toString(),
      "userid": userid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
