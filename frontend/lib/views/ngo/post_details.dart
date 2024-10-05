import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/controller/comments_controller.dart';
import 'package:frontend/controller/donation_controller.dart';
import 'package:frontend/controller/profile_controller.dart';
import 'package:frontend/model/create_need_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PostDetails extends StatelessWidget {
  final Need need;

  PostDetails({Key? key, required this.need}) : super(key: key);

  final ProfileController profileController = Get.put(ProfileController());
  final PaymentController payController = Get.put(PaymentController());
  final DonationController donationController = Get.put(DonationController());
  final RxInt selectedTab = 0.obs; // 0 for Transactions, 1 for Pull Request

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              need.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              need.description,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              height: MediaQuery.of(context).size.height * 0.3,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: bgColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Payment Gateway",
                                    style: TextStyle(
                                      color: subTextColor,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    alignment: Alignment.center,
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 1),
                                    width: double.infinity,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: overlayColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: TextFormField(
                                      controller: donationController
                                          .donationTextController,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: TextButton.icon(
                                      onPressed: () {
                                        donationController
                                            .donationPayments(need.id);
                                        Navigator.pop(context);
                                      },
                                      icon: const FaIcon(
                                        FontAwesomeIcons.plus,
                                        size: 17,
                                        color: primaryColor,
                                      ),
                                      label: const Text(
                                        "Proceed",
                                        style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: const Text(
                      "Contribute",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                    onPressed: () {
                      final CommentsController commentsController =
                          Get.put(CommentsController());
                      showModalBottomSheet(
                        context: context,
                        builder: (builder) {
                          return SingleChildScrollView(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(color: bgColor),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Obx(() => TextButton(
                                            onPressed: () {
                                              selectedTab.value =
                                                  0; // Show Transactions
                                            },
                                            child: Text(
                                              "Transactions",
                                              style: TextStyle(
                                                color: selectedTab.value == 0
                                                    ? primaryColor
                                                    : Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                          )),
                                      Obx(() => TextButton(
                                            onPressed: () {
                                              selectedTab.value =
                                                  1; // Show Pull Request
                                            },
                                            child: Text(
                                              "PullRequest",
                                              style: TextStyle(
                                                color: selectedTab.value == 1
                                                    ? primaryColor
                                                    : Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Obx(() {
                                    if (selectedTab.value == 0) {
                                      // Show Transactions
                                      return Column(
                                        children: commentsController.comments
                                            .map((review) {
                                          return Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            padding: const EdgeInsets.all(10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  review['name'],
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                                const SizedBox(height: 10),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      DateFormat('yyyy-MM-dd')
                                                          .format(DateTime
                                                              .parse(review[
                                                                  "donation_date"])),
                                                      style: const TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    Text(
                                                      review['donation_amount'],
                                                      style: const TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        }).toList(),
                                      );
                                    } else {
                                      // Show Pull Request

                                      return Column(
                                        children:
                                            commentsController.pr.map((pr) {
                                          return Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              padding: const EdgeInsets.all(10),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    pr['funder_name'],
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Text(
                                                    pr['offer'],
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ));
                                        }).toList(),
                                      );
                                    }
                                  }),
                                  const SizedBox(height: 20),
                                  const TextField(
                                    maxLines: null,
                                    decoration: const InputDecoration(
                                      hintText: "Write your review here...",
                                      hintStyle: TextStyle(color: subTextColor),
                                      border: InputBorder.none,
                                    ),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(height: 20),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: primaryColor,
                                      ),
                                      onPressed: () {
                                        // Handle review posting
                                      },
                                      child: const Text(
                                        "Post",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: const Text(
                      "Threads",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
