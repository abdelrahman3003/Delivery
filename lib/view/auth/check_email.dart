
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth/check_email_controller.dart';
import '../../controller/auth/forget_password_controller.dart';
import '../../core/class/data_handling_request.dart';
import 'widgets/check/check_body.dart';

class CheckEmail extends GetView<ForgetPasssowrdController> {
  const CheckEmail({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckEmailController());
    return Scaffold(
        body: GetBuilder<CheckEmailController>(
            builder: (checkcontroller) => DataHandlingRequsetState(
                  statusRequest: checkcontroller.statusRequest,
                  widget: CheckBody(
                    title: "Check Email",
                    subtitle:
                        "please enter your email address to recieve a verification code",
                    titlebold: controller.isforegetpassword
                        ? "Rest password"
                        : "Create account",
                  ),
                )));
  }
}
