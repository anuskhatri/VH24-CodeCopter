import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/controller/profile_controller.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Text(
          "Your Profile",
          style: TextStyle(
              color: Colors.white54, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        backgroundColor: bgColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Image Section
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(
                  Icons.person,
                  size: 80,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 20),

              // Organization Name
              const Text(
                "Asha Foundation",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),

              // Stats Section with Card Style
              GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildStatCard("Funds Raised",
                      profileController.fundsRaised.value.toString()),
                  _buildStatCard(
                      "Requests", profileController.requests.value.toString()),
                  _buildStatCard("Purchased Amount",
                      profileController.purchasedAmount.value.toString()),
                  _buildStatCard(
                      "Review", profileController.review.value.toString()),
                ],
              ),
              const SizedBox(height: 30),

              // Reviews Section Header
              Container(
                width: double.infinity,
                child: const Text(
                  "Reviews",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Dynamic Review List
              Column(
                children: profileController.reviews.map((review) {
                  return ReviewCard(review: review);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: subTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
// Removed the duplicate Review class definition Review({required this.userName, required this.reviewText});

class ReviewCard extends StatefulWidget {
  final Review review;

  const ReviewCard({super.key, required this.review});

  @override
  _ReviewCardState createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    // Adjust the max length for a review before truncating
    const int maxLength = 100;

    String displayReview =
        widget.review.reviewText.length > maxLength && !isExpanded
            ? '${widget.review.reviewText.substring(0, maxLength)}...'
            : widget.review.reviewText;

    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the user's name
            Text(
              widget.review.userName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            // Display the review text
            Text(
              displayReview,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: subTextColor,
              ),
            ),
            // Show the toggle for expanding
            if (widget.review.reviewText.length > maxLength)
              Text(
                isExpanded ? "Show Less" : "Show More",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
