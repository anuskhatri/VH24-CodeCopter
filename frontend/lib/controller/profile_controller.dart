import 'package:get/get.dart';

class Review {
  final String userName;
  final String reviewText;

  Review({required this.userName, required this.reviewText});
}

class ProfileController extends GetxController {
  var fundsRaised = 0.obs;
  var requests = 0.obs;
  var purchasedAmount = 0.obs;
  var review = 0.obs;
  var reviews = <Review>[
    Review(userName: "Alice", reviewText: "A wonderful organization doing great work! They have really helped the community with their initiatives and efforts to improve lives."),
    Review(userName: "Bob", reviewText: "Their support has been invaluable to our community. I cannot express how much we appreciate their assistance."),
    Review(userName: "Charlie", reviewText: "Highly recommend them for their dedication and impact. Their team is committed and always willing to lend a hand."),
    Review(userName: "David", reviewText: "This is a long review example. It is lengthy enough that it needs to be truncated. However, if it is expanded, you will see the entire review text without losing any information!"),
  ].obs; 
}
