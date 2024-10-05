import 'package:dio/dio.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/controller/role.dart';
import 'package:frontend/model/donation_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DonationController extends GetxController {
  var donations = <Donation>[].obs;
  var isLoading = false.obs;

  RoleStorage roleStorage = RoleStorage();

  final donationTextController = TextEditingController();

  final name = ''.obs;
  final contactInfo = ''.obs;
  final sumOfFunds = ''.obs;

  @override
  void onInit() {
    fetchDonations();
    super.onInit();
  }

  // Fetch donations using Dio
  Future<void> fetchDonations() async {
    isLoading(true);
    try {
      var response = await Dio().get('$baseUrl/profile/fetch-profile/2');
      if (response.statusCode == 200) {
        List<dynamic> donationData = response.data['donations'];
        donations.value = donationData
            .map((donation) => Donation.fromJson(donation))
            .toList();
        name.value = response.data['name'];
        contactInfo.value = response.data['contact_info'];
        sumOfFunds.value = response.data['sum_of_fund'];
        roleStorage.saveRole(response.data['role']);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch donations');
    } finally {
      isLoading(false);
    }
  }

  Future<void> donationPayments(int postId) async {
    Dio dio = Dio();
    try {
      final response =
          await dio.post("$baseUrl/post/donation-payment", data: {
            "post_id": postId,
            "doner_id": userId,
            "amount": donationTextController.text, 

          });
      if (response.statusCode == 200) {
        print(response);
      }
    } catch (e) {}
  }
}
