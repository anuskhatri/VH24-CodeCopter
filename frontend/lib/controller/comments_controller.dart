import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:get/get.dart';

class CommentsController extends GetxController{
  Dio _dio = Dio();
  var comments = [].obs;

  Future<void> fetchComments(int postId) async {
    try{
      final response = await _dio.get('$baseUrl/post/fetch-post-comment/$postId');
      print(response);
      if(response.statusCode == 200){
        comments.value = response.data;
      }
      
    }catch(e){
      print("Error fetching comments: $e");
    }
  }
}




class PaymentController extends GetxController {
  final paymentController = TextEditingController();
  Dio dio = Dio();
  var payments = [].obs;

  Future<void> fetchPayments(int postId) async {
    try {
      final response = await dio.get('$baseUrl/fetch-post-payment/$postId');
      print(response);
      if (response.statusCode == 200) {
        payments.value = response.data;
      }
    } catch (e) {
      print("Error fetching payments: $e");
    }
  }
}