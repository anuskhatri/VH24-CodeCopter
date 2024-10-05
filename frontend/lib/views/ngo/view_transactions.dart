import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/controller/profile_controller.dart';
import 'package:frontend/model/transaction_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RecentTransactions extends StatelessWidget {
  final ProfileController transactionController = Get.put(ProfileController());

  RecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Recent Transactions",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Obx(
                () => transactionController
                        .transactionLogs.isNotEmpty // Fix this condition
                    ? ListView.builder(
                        itemCount: transactionController.transactionLogs.length,
                        itemBuilder: (context, index) {
                          var transaction =
                              transactionController.transactionLogs[index];
                          return TransactionTile(transaction: transaction);
                        },
                      )
                    : const Center(
                        child: Text(
                          "No transactions available",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionTile extends StatelessWidget {
  const TransactionTile({super.key, required this.transaction});

  final Transactions transaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 45, 45, 45),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
             
              const SizedBox(height: 5),
              Text(
                transaction.description,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                DateFormat('yyyy-MM-dd')
                    .format(DateTime.parse(transaction.date)),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
              Text(
                transaction.amount.toString(),
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
