// NeedController with Dio for API calls
import 'package:dio/dio.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/model/create_need_model.dart';
import 'package:get/get.dart';

class NeedController extends GetxController {
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
      final response = await _dio.post('$baseUrl/',
          data: need.toJson()); // Replace with your API URL
      if (response.statusCode == 200) {
        needs.add(need); // Add need locally if API call is successful
      }
    } catch (e) {
      print("Error adding need: $e");
    }
  }
}
