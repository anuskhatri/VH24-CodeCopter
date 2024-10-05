import 'package:flutter/material.dart';
import 'package:frontend/controller/profile_controller.dart';
import 'package:frontend/model/create_need_model.dart';
import 'package:get/get.dart';

class NeedCard extends StatelessWidget {
  final Need need;

  NeedCard({super.key, required this.need});
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
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
                need.title,
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
            need.description,
            style: const TextStyle(color: Colors.white60),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                need.name,
                style: const TextStyle(color: Colors.white70, fontSize: 15),
              ),
              const Spacer(),
              Row(
                children: [
                  const Text(
                    "Funds ",
                    style: TextStyle(color: Colors.white60, fontSize: 15),
                  ),
                  Text(
                    need.currentFundedAmount.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}