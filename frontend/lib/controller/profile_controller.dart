import 'package:dio/dio.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/model/ngo_profile_model.dart';
import 'package:frontend/model/transaction_model.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    fetchProfileData();
  }

  var fundsRaised = ''.obs;
  var requests = ''.obs;
  var purchasedAmount = ''.obs;
  var ngoName = ''.obs;
  var contactInfo = ''.obs;
  var transactionLogs = <Transactions>[].obs;



  void addReview(Review review) {
    reviews.add(review);
  }

  var reviews = <Review>[
    Review(
        userName: "Alice",
        reviewText:
            "A wonderful organization doing great work! They have really helped the community with their initiatives and efforts to improve lives."),
    Review(
        userName: "Bob",
        reviewText:
            "Their support has been invaluable to our community. I cannot express how much we appreciate their assistance."),
    Review(
        userName: "Charlie",
        reviewText:
            "Highly recommend them for their dedication and impact. Their team is committed and always willing to lend a hand."),
    Review(
        userName: "David",
        reviewText:
            "This is a long review example. It is lengthy enough that it needs to be truncated. However, if it is expanded, you will see the entire review text without losing any information!"),
  ].obs;

  final Dio _dio = Dio();

  Future<void> fetchProfileData() async {
    try {
      final response = await _dio.get('$baseUrl/profile/fetch-profile/1');
      if (response.data.isNotEmpty) {
        final data = response.data[0];

        // Parsing NGO details
        ngoName.value = data['name'] ?? 'Unknown NGO';
        contactInfo.value = data['contact_info'] ?? 'No contact info';
        fundsRaised.value = data['total_funded_amount']?.toString() ?? "";
        requests.value = data['total_requests']?.toString() ?? "";
        purchasedAmount.value = data['total_purchase_amount']?.toString() ?? "";

        print(data["transaction_logs"]);

        // Parsing transaction logs
        if (data['transaction_logs'] != null) {
          transactionLogs.clear(); // Clear previous logs
          for (var log in data['transaction_logs']) {
            transactionLogs.add(
              Transactions.fromJson(log), // Use the factory method to create instances
            );
          }
        }
        print(transactionLogs);
      }
    } catch (e) {
      print('Error fetching profile data: $e');
    }
  }
}
