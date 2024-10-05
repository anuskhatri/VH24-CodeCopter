import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/controller/home_controller.dart';
import 'package:frontend/views/donor/donor_profile.dart';
import 'package:frontend/views/donor/list_posts.dart';
import 'package:frontend/views/ngo/profile_page.dart';
import 'package:get/get.dart';

class DonorHome extends StatelessWidget {
  final HomeController bottomNavController = Get.put(HomeController());

  DonorHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Obx(() {
        switch (bottomNavController.selectedIndex.value) {
          case 0:
            return DonorProfile();
          case 1:
            return ListPosts();
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
              icon: Icon(Icons.handshake_rounded, color: Colors.white),
              label: "Donate",
            ),
          ],
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.grey,
        );
      }),
    );
  }
}
