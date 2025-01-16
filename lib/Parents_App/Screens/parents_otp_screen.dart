// ignore_for_file: prefer_const_constructors, unrelated_type_equality_checks, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constrant/common_widgets.dart';
import '../../Constrant/preferences.dart';
import '../../Constrant/utilities.dart';
import '../Controllers/parents_logincontroller.dart';
import 'parents_homepage.dart';

class ParentsOtpScreen extends StatelessWidget {
  final ParentsLogincontroller controller = Get.put(ParentsLogincontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/login_img.png',
                height: 200), // Replace with your image
            SizedBox(height: 20),
            Obx(() => Text(
                  'Your OTP is: ${controller.generatedOtp.value}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              maxLength: 4,
              controller: controller.otpcontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter OTP',
              ),
              onChanged: (value) {
                if (value == controller.generatedOtp.value) {
                  Get.snackbar("Success", "OTP Matched!");
                }
              },
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                if (controller.otpcontroller.text ==
                    controller.generatedOtp.value) {
                  Get.offAll(ParentsHomepage());
                  Preference.preference.saveBool(PrefernceKey.isParentsFlow,
                      true); // Navigate to the next screen
                } else {
                  Get.snackbar("Error", "Please enter the correct OTP.");
                }
              },
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.btnBlue),
                child: Center(
                  child: CommonWidgets().textWidget(
                      text: 'Next',
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
