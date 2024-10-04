import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/controller/home_controller.dart';
import 'package:frontend/views/ngo/create_need.dart';
import 'package:frontend/views/ngo/profile_page.dart';
import 'package:get/get.dart';

class NGOHome extends StatelessWidget {
  final HomeController bottomNavController = Get.put(HomeController());

  NGOHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Obx(() {
        switch (bottomNavController.selectedIndex.value) {
          case 0:
            return ProfilePage();
          case 1:
            return CreateNeed();
          default:
            return ProfilePage();
        }
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          backgroundColor: bgColor,
          currentIndex: bottomNavController.selectedIndex.value,
          onTap: (index) {
            bottomNavController.changeTabIndex(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.white),
              label: "Profile",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list, color: Colors.white),
              label: "Requests",
            ),
          ],
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.grey,
        );
      }),
    );
  }
}
