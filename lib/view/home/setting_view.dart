import 'package:delivery/controller/home/setting_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingController());
    return const Center(child: Text("Setting"));
  }
}
