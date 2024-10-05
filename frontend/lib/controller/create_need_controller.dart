import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/model/create_need_model.dart';
import 'package:frontend/views/ngo/post_details.dart';
import 'package:get/get.dart';

class NeedController extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final reqAmountController = TextEditingController();

  var needs = <Need>[].obs;
  final Dio _dio = Dio();

  @override
  void onInit() {
    super.onInit();
    fetchNeeds();
  }

  Future<void> fetchNeeds() async {
    try {
      final response = await _dio.get('$baseUrl/post/fetch-all-post');
      print(response.data);
      if (response.statusCode == 200 && response.data != null) {
        needs.value = (response.data as List)
            .map((need) => Need.fromJson(need))
            .toList()
            .cast<Need>();
      }
    } catch (e) {
      print("Error fetching needs: $e");
    }
  }

  Future<void> addNeed() async {
    try {
      final response = await _dio.post('$baseUrl/post/add-post', data: {
        "ngoId": 1,
        "requestedAmount": reqAmountController.text,
        "postDescription": descriptionController.text,
        "postTitle": titleController.text,
      });

      if (response.statusCode == 200) {
        fetchNeeds();
      }
    } catch (e) {
      print("Error adding need: $e");
    }
  }

  Future<void> fetchPostByid(int id) async {
  try {
    final response = await _dio.get('$baseUrl/post/fetch-post-by-id/$id');
    print("API Response: ${response.data}");

    // Ensure the response is successful and a List
    if (response.statusCode == 200 && response.data is List) {
      final List<dynamic> postList = response.data;

      // Check if the list is not empty
      if (postList.isNotEmpty) {
        final postData = postList.first; // Access the first item of the list

        // Check if postData is a Map
        if (postData is Map<String, dynamic>) {
          // Parse the map into your Need model
          final post = Need.fromJson(postData);
          needs.add(post); // Add the post to the 'needs' list
          Get.to(() => PostDetails(need: post)); // Navigate to PostDetails
        } else {
          print("Error: Expected Map<String, dynamic> but got ${postData.runtimeType}");
        }
      } else {
        print("Error: No posts found.");
      }
    } else {
      print("Error: Expected List<dynamic> but got ${response.data.runtimeType}");
    }
  } catch (e) {
    print("Error fetching post by id: $e");
  }
}

}

class CategoryController extends GetxController {
  final categories = [
    'Charitable',
    'Service',
    'Advocacy',
    'Operational',
    'Environmental',
    'Educational',
    'Religious',
    'Research',
    'Human Rights',
    'Community-Based Organizations (CBOs)'
  ].obs;

  var selectedCategory = ''.obs;

  void updateCategory(String value) {
    selectedCategory.value = value;
  }
}
