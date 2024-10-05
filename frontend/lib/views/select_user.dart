import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/views/donor/donor_login.dart';
import 'package:frontend/views/ngo/ngo_login.dart';
import 'package:get/get.dart';

class SelectUser extends StatelessWidget {
  const SelectUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: const Text(
              "Select User Type",
              style: TextStyle(
                  color: Colors.white54,
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => NgoLogin());
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade800,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Center(
                          child: FaIcon(
                            FontAwesomeIcons.buildingNgo,
                            color: subTextColor,
                            size: 50,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "NGO",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => DonorLogin());
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade800,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Center(
                          child: FaIcon(
                            FontAwesomeIcons.heartPulse,
                            color: subTextColor,
                            size: 50,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Donor",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
