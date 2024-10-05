import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/views/donor/home.dart';
import 'package:frontend/views/ngo/home.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonorLoginController extends GetxController {
  final dio = Dio();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  // Future method to handle user registration
  Future<void> register() async {
    final name = nameController.text;
    final email = emailController.text;
    final password = passwordController.text;
    final phone = phoneController.text;

    // Input validation
    if (name.isEmpty || email.isEmpty || password.isEmpty || phone.isEmpty) {
      Get.snackbar("Error", "Please fill in all fields!",
          backgroundColor: Colors.red);
      return;
    }

    try {
      final response = await dio.post(
        '$baseUrl/auth/register', // Your base URL
        data: {
          "name": name,
          "email": email,
          "password": password,
          "phone": phone,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar("Success", "Registered successfully!",
            backgroundColor: Colors.green);
        // Clear text fields after successful registration
        nameController.clear();
        emailController.clear();
        passwordController.clear();
        phoneController.clear();
        Get.offAll(() => DonorHome()); // Navigate to home page on success
      } else {
        Get.snackbar("Error", "Registration failed. Please try again.",
            backgroundColor: Colors.red);
        print("Error: ${response.data}");
      }
    } on DioError catch (dioError) {
      Get.snackbar("Error", "Network error occurred during registration.",
          backgroundColor: Colors.red);
      print("DioError: ${dioError.message}");
      if (dioError.response != null) {
        print("Dio Response: ${dioError.response?.data}");
      }
    } catch (e) {
      Get.snackbar("Error", "An unknown error occurred.",
          backgroundColor: Colors.red);
      print("General Error: $e");
    }
  }
}


class NGOLoginController extends GetxController {
  // Controllers for TextFormField
  var NGOIdController = TextEditingController();
  var passwordController = TextEditingController();

  // Loading and session management
  var isLoading = false.obs;
  var sessionExists = false.obs;

  // Validators
  String? validateNGOId(String? value) {
    if (value == null || value.isEmpty) {
      return 'NGO ID is required';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  // Save session token using SharedPreferences
  Future<void> _saveSessionToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('session_token', token);
  }

  // Check if session token exists
  Future<void> checkSession() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('session_token');
    if (token != null && token.isNotEmpty) {
      sessionExists(true); // Session exists
      Get.to(() => NGOHome()); // Navigate to NGOHome
    }
  }

  // Login logic
  Future<void> login() async {
    if (validateNGOId(NGOIdController.text) == null &&
        validatePassword(passwordController.text) == null) {
      try {
        isLoading(true);
        // Simulate API call to authenticate
        await Future.delayed(const Duration(seconds: 2));

        // Simulated session token
        String token = 'sample_ngo_token';

        // Save session token
        await _saveSessionToken(token);
        sessionExists(true); // Set session existence

        Get.snackbar("Success", "Logged in successfully!",
            backgroundColor: Colors.green);
        Get.to(() => NGOHome());
      } catch (e) {
        Get.snackbar("Error", "Login failed. Please try again.",
            backgroundColor: Colors.red);
      } finally {
        isLoading(false);
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    checkSession(); // Check session on init
  }

  @override
  void onClose() {
    NGOIdController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
