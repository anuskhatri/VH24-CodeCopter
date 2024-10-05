import 'package:flutter/material.dart';
import 'package:frontend/views/donor/home.dart';
import 'package:frontend/views/ngo/home.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DonorLoginController extends GetxController {
  // Controllers for TextFormField
  var donorIdController = TextEditingController();
  var passwordController = TextEditingController();

  // Loading and session management
  var isLoading = false.obs;
  var sessionExists = false.obs;

  // Validators
  String? validateDonorId(String? value) {
    if (value == null || value.isEmpty) {
      return 'Donor ID is required';
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
      Get.to(() => DonorHome()); // Navigate to DonorHome
    }
  }



  // Login logic
  Future<void> login() async {
    if (validateDonorId(donorIdController.text) == null &&
        validatePassword(passwordController.text) == null) {
      try {
        isLoading(true);
        // Simulate API call to authenticate
        await Future.delayed(const Duration(seconds: 2));

        // Simulated session token
        String token = 'sample_donor_token';

        // Save session token
        await _saveSessionToken(token);
        sessionExists(true); // Set session existence

        Get.snackbar("Success", "Logged in successfully!",
            backgroundColor: Colors.green);
        Get.to(() => DonorHome());
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
    donorIdController.dispose();
    passwordController.dispose();
    super.onClose();
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
