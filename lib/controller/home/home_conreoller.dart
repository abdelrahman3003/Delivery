
import 'package:delivery/view/home/accepted_view.dart';
import 'package:delivery/view/home/pending_view.dart';
import 'package:delivery/view/home/setting_view.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';



class HomeController extends GetxController {
  int pageCount = 0;

  List<Widget> pageList = [
    const PendingView(),
    const AcceptedView(),
    const SettingView()
  ];

  changeTabIndex(i) {
    // switch (i) {
    //   case 0:
    //     Get.delete<PendingController>();
    //     Get.delete<AcceptedController>();
    //     Get.delete<SettingController>();
    //     break;
    //   case 1:
    //     Get.delete<HomeScreenControllerImp>();
    //     Get.delete<FavouriteControllerImp>();
    //     Get.delete<ProfileControllerImp>();
    //     break;
    //   case 2:
    //     Get.delete<CartControllerImp>();
    //     Get.delete<FavouriteControllerImp>();
    //     Get.delete<ProfileControllerImp>();
    //     Get.delete<HomeScreenControllerImp>();
    //     break;
    //   case 3:
    //     Get.delete<CartControllerImp>();
    //     Get.delete<HomeScreenControllerImp>();
    //     Get.delete<ProfileControllerImp>();
    //     break;
    //   case 4:
    //     Get.delete<CartControllerImp>();
    //     Get.delete<FavouriteControllerImp>();
    //     Get.delete<HomeScreenControllerImp>();
    //     break;
    //   // Add cases for other pages
    // }
    pageCount = i;
    update();
  }
}
