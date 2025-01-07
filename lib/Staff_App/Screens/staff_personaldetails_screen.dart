// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constrant/common_widgets.dart';
import '../Controllers/staff_profile_controller.dart';
import 'staff_dashboard.dart';
import 'staff_profilepage.dart';

class PersonalDetailsScreen extends StatelessWidget {
  final ProfileController profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () => Get.off(() => StaffDashboard()),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                Icons.home_rounded,
                size: 25,
              ),
            ),
          )
        ],
        title: CommonWidgets().textWidget(
            text: "Personal Details",
            textSize: 18.0,
            textWeight: FontWeight.w600),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonWidgets().textWidget(
                text: "Name :   ${profileController.name.value}",
                textSize: 18.0,
                textWeight: FontWeight.w600),
            SizedBox(height: 12),
            CommonWidgets().textWidget(
                text: "Birthdate :   ${profileController.birthdate.value}",
                textSize: 18.0,
                textWeight: FontWeight.w600),
            SizedBox(height: 12),
            CommonWidgets().textWidget(
                text:
                    "Qualification :   ${profileController.qualification.value}",
                textSize: 18.0,
                textWeight: FontWeight.w600),
            SizedBox(height: 12),
            CommonWidgets().textWidget(
                text: "Skills :   ${profileController.skills.value}",
                textSize: 18.0,
                textWeight: FontWeight.w600),
          ],
        ),
      ),
    );
  }
}
