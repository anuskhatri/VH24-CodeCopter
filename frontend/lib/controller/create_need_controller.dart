// NeedController with Dio for API calls
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/model/create_need_model.dart';
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
      print(response);
      needs.value = (response.data as List)
          .map((need) => Need.fromJson(need))
          .toList()
          .cast<Need>();
    } catch (e) {
      print("Error fetching needs: $e");
    }
  }

  Future<void> addNeed(Need need) async {
    try {
      final response = await _dio.post('$baseUrl/post/add-post', data: {
        "ngoId": 1,
        "requestedAmount": reqAmountController.text,
        "postDescription": descriptionController.text,
        "postTitle": titleController.text,
      }); // Replace with your API URL
      if (response.statusCode == 200) {
        fetchNeeds();
      }
    } catch (e) {
      print("Error adding need: $e");
    }
  }
}


class CategoryController extends GetxController {
  // List of categories
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
  ];

  // Variable to hold the selected category
  var selectedCategory = ''.obs;

  // Function to update selected category
  void updateCategory(String value) {
    selectedCategory.value = value;
  }
}
