import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home/home_conreoller.dart';
import 'home_page_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      body: GetBuilder<HomeController>(
        builder: (controller) => IndexedStack(
          index: controller.currentIndex,
          children: const [
            HomePageView(),
            Center(
              child: Text('Setting Page'),
            ),
          ],
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
              icon: Icon(Icons.home),
              label: 'Home',
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
