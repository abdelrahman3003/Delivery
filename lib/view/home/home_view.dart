import 'package:delivery/view/home/pending_view.dart';
import 'package:delivery/view/home/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home/home_conreoller.dart';
import 'accepted.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      body: GetBuilder<HomeController>(
        builder: (controller) => SafeArea(
          child: IndexedStack(
            index: controller.currentIndex,
            children: const [
              PendingView(),
              AcceptedView(),
              SettingView(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GetBuilder<HomeController>(
        builder: (controller) => BottomNavigationBar(
          currentIndex: controller.currentIndex,
          onTap: (index) {
            // Call the function in the controller to change the tab
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
