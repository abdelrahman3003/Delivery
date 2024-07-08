import 'package:get/get.dart';

import '../../core/constant/routsApp.dart';

class ForgetPasssowrdController extends GetxController {
  bool isforegetpassword = false;
  forgetpassword() {
    isforegetpassword = true;
    Get.toNamed(kCheckEmail);
    update();
  }
}
