import 'package:delivery/view/home/pending_view.dart';
import 'package:delivery/view/home/setting_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home/home_conreoller.dart';
import 'accepted_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      body: GetBuilder<HomeController>(
        builder: (controller) => SafeArea(
          child: controller.pageList[controller.pageCount],
        ),
      ),
      bottomNavigationBar: GetBuilder<HomeController>(
        builder: (controller) => BottomNavigationBar(
          currentIndex: controller.pageCount,
          onTap: (index) {
            controller.changeTabIndex(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.hourglass_empty),
              label: 'Pending',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check_circle),
              label: 'Accepteed',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Setting',
            ),
          ],
        ),
      ),
    );
  }
}
