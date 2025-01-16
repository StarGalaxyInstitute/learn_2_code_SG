// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_to_code/Constrant/common_widgets.dart';
import 'package:learn_to_code/Staff_App/Screens/staff_login.dart';

import '../../Constrant/utilities.dart';
import '../Controllers/staff_authcontroller.dart';

class StaffRegister extends StatelessWidget {
  StaffRegister({super.key});
  StaffAuthcontroller _authcontroller = Get.put(StaffAuthcontroller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Form(
              key: _authcontroller.formKey,
              child: Column(
                children: [
                  SizedBox(height: Get.height * 0.07),
                  CommonWidgets().textWidget(
                      text: "Welcome!\nSign up to Continue!",
                      textSize: 20.0,
                      textWeight: FontWeight.w700,
                      textAlign: TextAlign.center),
                  SizedBox(height: Get.height * 0.05),
                  CommonWidgets().textFieldBox(
                    controller: _authcontroller.userNameController,
                    labelText: "Username",
                    fieldIcon: Icons.person_outlined,
                    keyboardType: TextInputType.name,
                    passwordText: false,
                  ),
                  SizedBox(height: Get.height * 0.02),
                  CommonWidgets().textFieldBox(
                    controller: _authcontroller.emailController,
                    labelText: "Email",
                    fieldIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    passwordText: false,
                  ),
                  SizedBox(height: Get.height * 0.02),
                  CommonWidgets().textFieldBox(
                    controller: _authcontroller.passwordController,
                    labelText: "Password",
                    fieldIcon: Icons.lock_outline,
                    keyboardType: TextInputType.visiblePassword,
                    passwordText: true,
                  ),
                  SizedBox(height: Get.height * 0.02),
                  CommonWidgets().textFieldBox(
                    controller: _authcontroller.confirmPasswordController,
                    labelText: "Confirm Password",
                    fieldIcon: Icons.lock_outline,
                    keyboardType: TextInputType.visiblePassword,
                    passwordText: true,
                  ),
                  SizedBox(height: Get.height * 0.02),
                  CommonWidgets().textWidget(
                    text:
                        "By signing up you are agreed with our friendly terms and condition.",
                    textAlign: TextAlign.center,
                    textSize: 13.0,
                    textWeight: FontWeight.w500,
                  ),
                  SizedBox(height: Get.height * 0.05),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => StaffLogin());
                    },
                    child: CommonWidgets().textWidget(
                      text: "Already have an account?",
                      textSize: 14.0,
                      textColor: AppColors.btnBlue,
                      textWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: Get.height * 0.04),
                  GestureDetector(
                    onTap: () {
                  
                      _authcontroller.validationCheck();
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
                          text: "Register",
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
      ),
    );
  }
}
