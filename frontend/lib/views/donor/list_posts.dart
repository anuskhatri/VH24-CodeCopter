import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/controller/comments_controller.dart';
import 'package:frontend/controller/create_need_controller.dart';
import 'package:frontend/views/ngo/post_details.dart';
import 'package:frontend/widgets/need_card.dart';
import 'package:get/get.dart';

class ListPosts extends StatelessWidget {
  const ListPosts({super.key});

  @override
  Widget build(BuildContext context) {
    final NeedController controller = Get.put(NeedController());
    final CommentsController commentsController = Get.put(CommentsController());

    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, top: 50, bottom: 10),
            child: Text(
              "NGO Requests",
              style: TextStyle(
                  color: Colors.white54,
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: controller.needs.length,
              itemBuilder: (context, index) {
                final need = controller.needs[index];
                return GestureDetector(
                    onTap: () async {
                      await controller.fetchPostByid(need.id);
                      commentsController.fetchPr(need.id);
                      commentsController.fetchComments(need.id);
                    },
                    child: NeedCard(need: need));
              },
            ),
          ),
        ],
      ),
    );
  }
}
