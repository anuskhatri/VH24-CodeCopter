import 'package:flutter/material.dart';
import 'package:frontend/constants.dart'; // Assume this includes your colors and other constants.
import 'package:get/get.dart'; // Required for GetX functionality
import 'package:frontend/controller/login_controller.dart';

class DonorSignUp extends StatelessWidget {
  const DonorSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final DonorLoginController controller = Get.put(DonorLoginController());

    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Register as a Donor",
              style: TextStyle(
                color: primaryColor,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),

            // Full Name Field
            Text(
              "Full Name",
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            TextFormField(
              controller: controller.nameController,
              decoration: InputDecoration(
                filled: true,
                fillColor: overlayColor, // Light background for input fields
                prefixIcon: Icon(Icons.person, color: primaryColor),
                hintText: "Enter your full name",
                hintStyle: const TextStyle(color: subTextColor),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none, // No border initially
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: primaryColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade700),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),

            // Email Field
            Text(
              "Email",
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            TextFormField(
              controller: controller.emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                filled: true,
                fillColor: overlayColor, // Light background for input fields
                prefixIcon: Icon(Icons.email, color: primaryColor),
                hintText: "Enter your email",
                hintStyle: const TextStyle(color: subTextColor),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none, // No border initially
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: primaryColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade700),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),

            // Password Field
            Text(
              "Password",
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            TextFormField(
              controller: controller.passwordController,
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: overlayColor, // Light background for input fields
                prefixIcon: Icon(Icons.lock, color: primaryColor),
                hintText: "Enter your password",
                hintStyle: const TextStyle(color: subTextColor),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none, // No border initially
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: primaryColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade700),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),

            // Phone Number Field
            Text(
              "Phone Number",
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            TextFormField(
              controller: controller.phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                filled: true,
                fillColor: overlayColor, // Light background for input fields
                prefixIcon: Icon(Icons.phone, color: primaryColor),
                hintText: "Enter your phone number",
                hintStyle: const TextStyle(color: subTextColor),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none, // No border initially
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: primaryColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade700),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 40),

            // Sign Up Button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                ),
                onPressed: () {
                  controller.register(); // Register action
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
