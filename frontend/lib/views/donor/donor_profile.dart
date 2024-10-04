import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/controller/profile_controller.dart';
import 'package:frontend/model/ngo_profile_model.dart';
import 'package:frontend/views/ngo/view_transactions.dart';
import 'package:get/get.dart';

class DonorProfile extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());

  DonorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Text(
          "Your Profile",
          style: TextStyle(
              color: Colors.white54, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        backgroundColor: bgColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Image Section
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 80,
                      color: Colors.white70,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                color: bgColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Contact Info',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(height: 10), // Add some spacing
                                  Text(
                                    // Replace with your actual contact info from the controller
                                    // profileController.contactInfo.value,
                                    "1234567890",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: const Icon(
                      FontAwesomeIcons.circleInfo,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),

              Text(
                "Aditya Hakani",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: double.infinity,
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text("Amount Donated: ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                    Spacer(),
                    Text("₹ 10,100",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                margin: EdgeInsets.all(10),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Your Activity",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 1, // Replace with the actual number of items
                      itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                        borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                          children: [
                            Text(
                            "Donate Clothes",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                            const Spacer(),
                          ],
                          ),
                          Text(
                          "Donated 5 clothes to the needy",
                          style: const TextStyle(color: Colors.white60),
                          ),
                          const SizedBox(height: 10),
                          Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                            "NGO 11",
                            style: const TextStyle(
                              color: Colors.white70, fontSize: 15),
                            ),
                            const Spacer(),
                            Row(
                            children: [
                              const Text(
                              "Funds ",
                              style: TextStyle(
                                color: Colors.white60, fontSize: 15),
                              ),
                              Text(
                              "10,100",
                              style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                              ),
                            ],
                            ),
                          ],
                          ),
                        ],
                        ),
                      );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
