import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentIndex = 0;
  void changeTabIndex(int index) {
    currentIndex = index;
    update();
  }
}
