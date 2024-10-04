import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/controller/create_need_controller.dart';
import 'package:frontend/model/create_need_model.dart';
import 'package:get/get.dart';

class CreateNeed extends StatelessWidget {
  final NeedController controller = Get.put(NeedController());

  CreateNeed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: const Text(
          "Your Requests",
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: Colors.white54,
          ),
        ),
        actions: [
          TextButton(
            style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all(primaryColor),
            ),
            onPressed: () {
              _showCreateNeedDialog(context);
            },
            child: const Row(
              children: [
                Icon(Icons.add),
                Text("Create Need"),
              ],
            ),
          )
        ],
      ),
      body: Obx(() {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.needs.length,
                itemBuilder: (context, index) {
                  final need = controller.needs[index];
                  return NeedCard(need: need);
                },
              ),
            ),
          ],
        );
      }),
    );
  }
  void _showCreateNeedDialog(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height * 0.55,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Enter your requirements",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                _buildTextField("Title", titleController),
                const SizedBox(height: 20),
                _buildTextField("Description", descriptionController),
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton.icon(
                    onPressed: () async {
                      final need = Need(
                        title: titleController.text,
                        organization: "Your Organization", // Adjust as needed
                        desc: descriptionController.text,
                        current_funded_amt:
                            "0.00", // Default or user-input as needed
                      );
                      await controller.addNeed(need);
                      Navigator.of(context).pop();
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.plus,
                      size: 17,
                      color: Colors.blue,
                    ),
                    label: const Text(
                      "Add Request",
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  // Helper function for text fields
  Widget _buildTextField(String hint, TextEditingController controller) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 1),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white70),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
        ),
      ),
    );
  }
}

class NeedCard extends StatelessWidget {
  final Need need;
  final RxBool isDescriptionVisible = false.obs;

  NeedCard({super.key, required this.need});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isDescriptionVisible.toggle();
      },
      child: Obx(() {
        return Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                need.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                need.organization,
                style: const TextStyle(color: Colors.white70, fontSize: 13),
              ),
              if (isDescriptionVisible.value)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    need.desc,
                    style: const TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text(
                    "Qty: ",
                    style: TextStyle(color: Colors.white60, fontSize: 15),
                  ),
                  Text(
                    need.current_funded_amt,
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.circle, color: primaryColor, size: 7),
                  const SizedBox(width: 10),
                  const Text(
                    "Current Funded Amount: ",
                    style: TextStyle(color: Colors.white60, fontSize: 15),
                  ),
                  Text(
                    need.current_funded_amt,
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
