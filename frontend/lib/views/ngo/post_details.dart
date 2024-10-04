import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/controller/create_need_controller.dart';
import 'package:get/get.dart';

class PostDetails extends StatelessWidget {
  final int postId;
  const PostDetails({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    final NeedController controller = Get.put(NeedController());

    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Text(controller.needs[postId].title,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white))),
            const SizedBox(height: 10),
            Obx(() => Text(controller.needs[postId].desc,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.white))),
          ],
        ),
      ),
    );
  }
}
