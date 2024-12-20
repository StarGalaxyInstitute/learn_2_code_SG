// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_to_code/Constrant/preferences.dart';
import 'package:learn_to_code/Parents_App/Screens/parents_homepage.dart';

import '../../Constrant/common_widgets.dart';
import '../../Constrant/utilities.dart';

class ParentsRegister extends StatelessWidget {
  const ParentsRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: Get.height * 0.07),
                CommonWidgets().textWidget(
                    text: "Welcome!\nSign in to Continue!",
                    textSize: 20.0,
                    textWeight: FontWeight.w700,
                    textAlign: TextAlign.center),
                SizedBox(height: Get.height * 0.05),
                CommonWidgets().textFieldBox(
                  labelText: "Student ID Number",
                  fieldIcon: Icons.person_outlined,
                  keyboardType: TextInputType.name,
                  passwordText: false,
                ),
                SizedBox(height: Get.height * 0.02),
                CommonWidgets().textFieldBox(
                  labelText: "Email",
                  fieldIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  passwordText: false,
                ),
                SizedBox(height: Get.height * 0.02),
                CommonWidgets().textWidget(
                  text:
                      "By signing up you are agreed with our friendly terms and condition.",
                  textAlign: TextAlign.center,
                  textSize: 13.0,
                  textWeight: FontWeight.w500,
                ),
                SizedBox(height: Get.height * 0.04),
                GestureDetector(
                  onTap: () {
                    Get.off(() => ParentsHomepage());
                    Preference.preference
                        .saveBool(PrefernceKey.isParentsFlow, true);
                  },
                  child: Container(
                    width: Get.width,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: AppColors.btnBlue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: CommonWidgets().textWidget(
                        text: "Login",
                        textSize: 16.0,
                        textColor: AppColors.whitecolor,
                        textWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
