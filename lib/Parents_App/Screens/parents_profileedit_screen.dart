// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_to_code/Parents_App/Screens/parents_profile_screen.dart';
import '../../Constrant/common_widgets.dart';
import '../../Constrant/utilities.dart';
import '../Controllers/parents_profile_controller.dart';

class ParentsProfileEditScreen extends StatelessWidget {
  final ParentsProfileController controller =
      Get.put(ParentsProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Get.off(ParentsProfileScreen());
            },
            child: Icon(Icons.arrow_back)),
        title: CommonWidgets().textWidget(
          text: "Edit Profile",
          textWeight: FontWeight.bold,
          textSize: 17.0,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
              controller: controller.nameController,
            ),
            SizedBox(height: 30),
            TextField(
              controller: controller.phoneController,
              decoration: InputDecoration(
                  labelText: 'Phone Number', border: OutlineInputBorder()),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                controller.verifyPhoneNumber();
              },
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.btnBlue),
                child: Center(
                  child: CommonWidgets().textWidget(
                      text: 'Save Changes',
                      textColor: AppColors.whitecolor,
                      textAlign: TextAlign.start,
                      textSize: 14.0,
                      textWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
