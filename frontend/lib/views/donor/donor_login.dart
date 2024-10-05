import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/controller/login_controller.dart';
import 'package:get/get.dart';

class DonorLogin extends StatelessWidget {
  DonorLogin({super.key});
  final loginController = Get.put(DonorLoginController());
  final _formKey = GlobalKey<FormState>(); // Form key for validation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Obx(
          () => Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xff2B2B2B),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Center(
                    child: FaIcon(
                      FontAwesomeIcons.heartPulse,
                      color: subTextColor,
                      size: 50,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  "Donor Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: const Color(0xff2A2A2A),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Enter your credentials",
                            style: TextStyle(
                              color: Color.fromARGB(255, 169, 169, 169),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        if (!loginController.sessionExists.value)
                          TextFormField(
                            controller: loginController.donorIdController,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              labelStyle: TextStyle(color: Colors.white),
                              labelText: 'Donor ID',
                            ),
                            validator: (value) =>
                                loginController.validateDonorId(value),
                          ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: loginController.passwordController,
                          style: const TextStyle(color: Colors.white),
                          obscureText: true,
                          decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            labelStyle: TextStyle(color: Colors.white),
                            labelText: 'Password',
                          ),
                          validator: (value) =>
                              loginController.validatePassword(value),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all(
                                  primaryColor), // Corrected
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xff2B2B2B)),
                              splashFactory: NoSplash.splashFactory,
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                loginController
                                    .login(); // Use the same login method for all cases
                              }
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
