import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth/reset_password_controller.dart';
import '../../core/class/data_handling_request.dart';
import 'widgets/restpassword/restpassword_body.dart';

class RestPassword extends StatelessWidget {
  const RestPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordController());
    return Scaffold(
        body: GetBuilder<ResetPasswordController>(
            builder: (controller) => DataHandlingRequsetState(
                  statusRequest: controller.statusRequest,
                  widget: const ResetpasswordBody(),
                )));
  }
}
