// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_field, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_to_code/App_flow/app_flow_controller.dart';
import 'package:learn_to_code/Constrant/preferences.dart';
import 'package:learn_to_code/Constrant/utilities.dart';
import 'package:learn_to_code/Constrant/common_widgets.dart';
import 'package:learn_to_code/Parents_App/Screens/parents_register.dart';
import 'package:learn_to_code/Staff_App/Screens/staff_dashboard.dart';
import 'package:learn_to_code/Staff_App/Screens/staff_register.dart';
import 'package:learn_to_code/Students_App/Screens/student_register.dart';

class AppFlowsetPage extends StatelessWidget {
  AppFlowController _appFlowController = Get.put(AppFlowController());
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Please Select!\nWhat's Your Role?",
                textAlign: TextAlign.center,
                style: GoogleFonts.rubik(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 25),
              typeBox(
                image: 'assets/images/student.png',
                typeText: "A Students",
                actionIcon: _appFlowController.selectType.value == 1
                    ? Icons.check_box
                    : null,
                borderColor: _appFlowController.selectType.value == 1
                    ? AppColors.btnBlue
                    : AppColors.greycolor,
                ontapped: () {
                  _appFlowController.selectType.value = 1;
                },
              ),
              typeBox(
                image: 'assets/images/teacher.png',
                typeText: "A Tutor",
                actionIcon: _appFlowController.selectType.value == 2
                    ? Icons.check_box
                    : null,
                borderColor: _appFlowController.selectType.value == 2
                    ? AppColors.btnBlue
                    : AppColors.greycolor,
                ontapped: () {
                  _appFlowController.selectType.value = 2;
                },
              ),
              typeBox(
                image: 'assets/images/parents.png',
                typeText: "A Parents",
                borderColor: _appFlowController.selectType.value == 3
                    ? AppColors.btnBlue
                    : AppColors.greycolor,
                actionIcon: _appFlowController.selectType.value == 3
                    ? Icons.check_box
                    : null,
                ontapped: () {
                  _appFlowController.selectType.value = 3;
                },
              ),
              SizedBox(height: 25),
              GestureDetector(
                onTap: () {
                  Preference.preference
                      .saveBool(PrefernceKey.isIntroductionScreenLoaded, true);
                  if (_appFlowController.selectType.value == 0) {
                    CommonWidgets().toast(
                      toastColor: Colors.red,
                      toastMsg: "Please Select Anyone",
                    );
                  } else if (_appFlowController.selectType.value == 1) {
                    CommonWidgets()
                        .toast(
                      toastColor: Colors.green,
                      toastMsg: "Enter With Student Role",
                    )
                        .whenComplete(
                      () {
                        Get.to(() => StudentRegister());
                      },
                    );
                  } else if (_appFlowController.selectType.value == 2) {
                    CommonWidgets()
                        .toast(
                      toastColor: Colors.green,
                      toastMsg: "Enter With Tutor Role",
                    )
                        .whenComplete(
                      () {
                        if (_appFlowController.isaccess == true) {
                          Get.to(() => StaffDashboard());
                        } else {
                          Get.to(() => StaffRegister());
                        }
                      },
                    );
                  } else if (_appFlowController.selectType.value == 3) {
                    CommonWidgets()
                        .toast(
                      toastColor: Colors.green,
                      toastMsg: "Enter With Parents Role",
                    )
                        .whenComplete(
                      () {
                        Get.to(() => ParentsRegister());
                      },
                    );
                  }
                },
                child: Container(
                  width: Get.width,
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    color: AppColors.btnBlue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Next",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                      fontSize: 20,
                      color: AppColors.whitecolor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget typeBox({image, ontapped, typeText, borderColor, actionIcon}) {
    return GestureDetector(
      onTap: ontapped,
      child: Container(
        height: 100,
        width: Get.width,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Image.asset(
              image,
            ),
            SizedBox(width: 20),
            Text(
              typeText,
              style: GoogleFonts.rubik(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            Icon(actionIcon, color: AppColors.btnBlue)
          ],
        ),
      ),
    );
  }
}
