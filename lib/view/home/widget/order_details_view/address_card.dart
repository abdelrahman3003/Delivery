import 'package:delivery/controller/home/details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/constant/colors.dart';

class AddressCard extends GetView<DetailsController> {
  const AddressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: Get.height / 3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: ColorsApp.kprimaryColor1)),
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: controller.kGooglePlex!,
        onMapCreated: (GoogleMapController gcontroller) {
          controller.completerController!.complete(gcontroller);
        },
      ),
    );
  }
}
