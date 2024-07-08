import 'package:delivery/core/constant/routsApp.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../../core/class/statuscode.dart';
import '../../core/functions/handling _data.dart';
import '../../core/services/services.dart';
import '../../data/remote/auth/posdata_signin.dart';

class SigninController extends GetxController {
  PostDataSignin postDataSignup = PostDataSignin(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  AppServices appServices = Get.find();

  signin(String email, String password) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await postDataSignup.postDataSignin(email, password);
    statusRequest = handlingApiData(response);

    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "failure") {
        statusRequest = StatusRequest.failure;
        Get.defaultDialog(
          title: "error",
          middleText: "invalid details",
        );
      } else {
        // FirebaseMessaging.instance.getToken().then((value) {
        //   String? token = value;
        //   print("========$token");
        // });
        appServices.sharedPreferences
            .setString("username", "${response['data'][0]['delivery_name']}");
        appServices.sharedPreferences
            .setString("id", "${response['data'][0]['delivery_id']}");
        String userid = appServices.sharedPreferences.getString("id")!;
        appServices.sharedPreferences
            .setString("email", response['data'][0]['delivery_email']);
        appServices.sharedPreferences
            .setString("phone", response['data'][0]['delivery_phone']);
        appServices.sharedPreferences.setInt("home", 8);
        appServices.sharedPreferences.setInt("company", 9);
        appServices.sharedPreferences.setString("step", "1");
        FirebaseMessaging.instance.subscribeToTopic("delivery");
        FirebaseMessaging.instance.subscribeToTopic("delivery$userid");
        Get.offNamed(kHomeView);
      }

      update();
    } else {}
  }
}
