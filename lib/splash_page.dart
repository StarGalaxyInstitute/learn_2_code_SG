// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_to_code/App_flow/app_flowset_page.dart';
import 'package:learn_to_code/App_flow/intro_page.dart';
import 'package:learn_to_code/Constrant/common_widgets.dart';
import 'package:learn_to_code/Constrant/preferences.dart';
import 'package:learn_to_code/Constrant/utilities.dart';
import 'package:learn_to_code/Parents_App/Screens/parents_homepage.dart';
import 'package:learn_to_code/Staff_App/Screens/staff_dashboard.dart';
import 'package:learn_to_code/Students_App/Screens/student_dashboard.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 5),
      () async {
        var isIntroductionScreenLoaded = await Preference.preference.getBool(
            key: PrefernceKey.isIntroductionScreenLoaded, defVal: false);
        var isStudentFlow = await Preference.preference
            .getBool(key: PrefernceKey.isStudentFlow, defVal: false);
        var isStaffFlow = await Preference.preference
            .getBool(key: PrefernceKey.isStaffFlow, defVal: false);
        var isParentsFlow = await Preference.preference
            .getBool(key: PrefernceKey.isParentsFlow, defVal: false);
// =============================================================================
        if (isIntroductionScreenLoaded == false) {
          Get.off(() => IntroPage());
        } else if (isIntroductionScreenLoaded == true &&
            isStaffFlow == false &&
            isParentsFlow == false &&
            isStudentFlow == false) {
          Get.off(() => AppFlowsetPage());
        } else if (isStudentFlow == true) {
          Get.off(() => StudentDashboard());
        } else if (isStaffFlow == true) {
          Get.off(() => StaffDashboard());
        } else if (isParentsFlow == true) {
          Get.off(() => ParentsHomepage());
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                height: 100,
                child: Image.asset(
                  'assets/images/SG_logo.png',
                ),
              ),
            ),
            SizedBox(height: 10),
            CommonWidgets().textWidget(
                text: "Star Galaxy\nInstitute",
                textSize: 20.0,
                textWeight: FontWeight.w500,
                textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
