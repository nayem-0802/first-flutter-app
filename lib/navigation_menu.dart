import 'package:first_flutter_app/features/main_screens/guide/guide_list.dart';
import 'package:first_flutter_app/features/main_screens/home.dart';
import 'package:first_flutter_app/features/main_screens/search_screen.dart';
import 'package:first_flutter_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'features/main_screens/profile.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: AppColor.txt_secondary,
          indicatorColor: AppColor.primary_color,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          destinations: const [
            NavigationDestination(
              icon: Icon(Iconsax.home, color: Colors.white),
              selectedIcon: Icon(Iconsax.home),
              label: "Home",
            ),
            NavigationDestination(
                icon: Icon(Iconsax.search_normal, color: Colors.white),
                selectedIcon: Icon(Iconsax.search_normal),
                label: "Search"),
            NavigationDestination(
                icon: Icon(Iconsax.people, color: Colors.white),
                selectedIcon: Icon(Iconsax.people),
                label: "All Guide"),
            NavigationDestination(
                icon: Icon(Iconsax.user, color: Colors.white),
                selectedIcon: Icon(Iconsax.user),
                label: "profile"),
          ],
        ),
      ),
      body: Obx(() => controller.screen[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screen = [
    const HomeScreen(),
    SearchScreen(),
    GuideList(),
    ProfilePage(),
  ];
}
