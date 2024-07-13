import 'package:delivery/controller/home/accepted_controller.dart';
import 'package:delivery/controller/home/pending_controller..dart';
import 'package:delivery/controller/home/setting_controller.dart';
import 'package:get/get.dart';

putControllers(int index) {
  if (index == 1) {
  return  Get.put(AcceptedController());
  }
   else if (index == 2) {
 return   Get.put(SettingController());
  }
  return Get.put(PendingController());
  }

