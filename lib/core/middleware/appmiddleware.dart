import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/routsApp.dart';
import '../services/services.dart';

class AppMiddleWare extends GetMiddleware {
  @override
  int? priority = 0;
  AppServices appServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (appServices.sharedPreferences.getString("step") == "2") {
      return const RouteSettings(name: kSignin);
    }
    if (appServices.sharedPreferences.getString("step") == "1") {
      return const RouteSettings(name: kSignin);
    }

    return null;
  }
}
