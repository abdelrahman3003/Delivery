import 'package:get/get.dart';

import '../class/crud.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
