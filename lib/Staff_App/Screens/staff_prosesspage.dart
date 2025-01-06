// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_to_code/Constrant/utilities.dart';

import '../../Constrant/common_widgets.dart';
import '../../Constrant/preferences.dart';
import 'staff_dashboard.dart';

class StaffProcesspage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          title: CommonWidgets().textWidget(
              text: 'Process',
              textSize: 17.0,
              textAlign: TextAlign.start,
              textWeight: FontWeight.bold),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Get.back(),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImage.images + "process.png"),
            SizedBox(
              height: 30,
            ),
            CommonWidgets().textWidget(
                text: "Your Profile In Processing..",
                textSize: 20.0,
                textWeight: FontWeight.bold,
                textAlign: TextAlign.center),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Preference.preference.saveBool(PrefernceKey.isaccess, true);
                Get.offAll(StaffDashboard());
                Preference.preference.saveBool(PrefernceKey.isStaffFlow, true);
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.btnBlue),
                child: Center(
                  child: CommonWidgets().textWidget(
                      text: 'Go To Home',
                      textColor: AppColors.whitecolor,
                      textAlign: TextAlign.start,
                      textSize: 14.0,
                      textWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ));
  }
}
