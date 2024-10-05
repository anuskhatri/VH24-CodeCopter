import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/controller/create_need_controller.dart';
import 'package:frontend/controller/profile_controller.dart';
import 'package:frontend/model/create_need_model.dart';
import 'package:frontend/views/ngo/post_details.dart';
import 'package:frontend/widgets/need_card.dart';
import 'package:get/get.dart';

class CreateNeed extends StatelessWidget {
  final NeedController controller = Get.put(NeedController());

  CreateNeed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: bgColor,
        title: const Text(
          "JanSeva",
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
                Text("Create Post"),
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
                  return GestureDetector(
                      onTap: () => Get.to(() => PostDetails(
                            need: need,
                          )),
                      child: NeedCard(need: need));
                },
              ),
            ),
            
          ],
        );
      }),
    );
  }

  void _showCreateNeedDialog(BuildContext context) {
    // Use the existing instance of NeedController
    final NeedController needController = Get.find<NeedController>();
    final categoryController =
        Get.put<CategoryController>(CategoryController());
    showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: bgColor,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 1),
                width: double.infinity,
                child: TextFormField(
                  controller: controller.titleController,
                  style: const TextStyle(color: Colors.white, fontSize: 30),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Title",
                    hintStyle:
                        const TextStyle(color: Colors.white70, fontSize: 30),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                  ),
                ),
              ),
              // Divider(
              //   color: Colors.white,
              //   thickness: 1,
              // ),
              const SizedBox(height: 10),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 1),
                width: double.infinity,
                child: TextFormField(
                  maxLines: null,
                  controller: controller.descriptionController,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Describe why you need funds",
                    hintStyle:
                        const TextStyle(color: Colors.white70, fontSize: 20),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 1),
                width: double.infinity,
                child: TextFormField(
                  controller: controller.reqAmountController,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Required Amount",
                    hintStyle:
                        const TextStyle(color: Colors.white70, fontSize: 20),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // add dropdown for category and on selection display with border
              Obx(() {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      dropdownColor: bgColor,
                      value: categoryController.selectedCategory.value.isEmpty
                          ? null
                          : categoryController.selectedCategory.value,
                      hint: const Text(
                        'Select a Category',
                        style: TextStyle(color: Colors.white70),
                      ),
                      isExpanded: true,
                      items:
                          categoryController.categories.map((String category) {
                        return DropdownMenuItem<String>(
                          value: category,
                          child: Text(
                            category,
                            style: const TextStyle(color: Colors.white),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        categoryController.updateCategory(newValue!);
                      },
                    ),
                  ),
                );
              }),
              const SizedBox(height: 20),

              Container(
                margin: EdgeInsets.only(right: 20),
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  onPressed: () async {
                    await controller.addNeed();
                    Navigator.of(context).pop();
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.plus,
                    size: 17,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "Add Request",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
