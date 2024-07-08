import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/constant/binding.dart';
import 'core/constant/routsApp.dart';
import 'core/localization/local_controller.dart';
import 'core/localization/translations.dart';

class Delivery extends StatelessWidget {
  const Delivery({super.key});

  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      locale: controller.language,
      translations: AppTrnaslations(),
      debugShowCheckedModeBanner: false,
      getPages: getPages,
      initialBinding: AppBinding(),
      //routes: routes,
      theme: ThemeData(fontFamily: "Cairo"),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
