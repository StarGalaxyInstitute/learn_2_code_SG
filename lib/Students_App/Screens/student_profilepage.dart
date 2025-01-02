// ignore_for_file: prefer_const_constructors, unused_import, use_key_in_widget_constructors, must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_to_code/Constrant/common_widgets.dart';
import 'package:learn_to_code/Constrant/utilities.dart';
import 'package:learn_to_code/Students_App/Controllers/student_profilecontroller.dart';
import 'package:learn_to_code/Students_App/Screens/student_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentProfilepage extends StatelessWidget {
  StudentProfilecontroller studentProfilecontroller =
      Get.put(StudentProfilecontroller());
  showAlertDialog(BuildContext context) {
    Widget cancelButton = TextButton(
      child: Text(
        "No",
        style: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      onPressed: () {
        Get.back();
      },
    );
    Widget continueButton = TextButton(
      child: Text(
        "Yes",
        style: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      onPressed: () async {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.clear();
        Get.offAll(() => StudentLogin());
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text(
        "Logout",
        style: GoogleFonts.rubik(fontSize: 20, fontWeight: FontWeight.w700),
      ),
      content: Text(
        "Are you sure for Logout?",
        style: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
          body: Stack(
            children: [
              studentProfilecontroller.isLoader.value
                  ? SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: Get.height * 0.02),
                          CommonWidgets().textWidget(
                              text: "Profile",
                              textSize: 20.0,
                              textWeight: FontWeight.w600),
                          Center(
                            child: Container(
                              width: Get.width * 0.9,
                              margin: EdgeInsets.only(top: Get.height * 0.02),
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: AppColors.greycolor.withOpacity(.5),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                          radius: 30,
                                          backgroundImage: NetworkImage(
                                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6Hb5xzFZJCTW4cMqmPwsgfw-gILUV7QevvQ&s")),
                                      GestureDetector(
                                        // onTap: () {
                                        //   CommonFunctions().pickImageFromGallery();
                                        // },
                                        child: Container(
                                          height: 30,
                                          width: Get.width * 0.35,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppColors.whitecolor),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Center(
                                            child: CommonWidgets().textWidget(
                                                text: "Change Photo",
                                                textSize: 14.0,
                                                textWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  CommonWidgets().textWidget(
                                      text: "Test User",
                                      textSize: 18.0,
                                      textWeight: FontWeight.w700),
                                  CommonWidgets().textWidget(
                                      text: "+91 1234567890",
                                      textSize: 14.0,
                                      textWeight: FontWeight.w500),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            width: Get.width * 0.9,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CommonWidgets().textWidget(
                                        text: "University ID",
                                        textSize: 14.0,
                                        textWeight: FontWeight.w700),
                                    CommonWidgets().textWidget(
                                        text: "1234567890",
                                        textSize: 15.0,
                                        textWeight: FontWeight.w600),
                                  ],
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CommonWidgets().textWidget(
                                        text: "Deparment",
                                        textSize: 14.0,
                                        textWeight: FontWeight.w700),
                                    CommonWidgets().textWidget(
                                        text: "Computer Science Department",
                                        textSize: 15.0,
                                        textWeight: FontWeight.w600),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            width: Get.width * 0.9,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Icon(Icons.person_outlined),
                                  contentPadding: EdgeInsets.zero,
                                  minTileHeight: 0,
                                  // onTap: () {
                                  //   Get.to(() => PersonalInformationPage());
                                  // },
                                  title: CommonWidgets().textWidget(
                                      text: "Personal Information",
                                      textSize: 14.0,
                                      textWeight: FontWeight.w600),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                  ),
                                ),
                                Divider(),
                                ListTile(
                                  leading: Icon(Icons.payment_outlined),
                                  contentPadding: EdgeInsets.zero,
                                  minTileHeight: 0,
                                  // onTap: () {
                                  //   Get.to(() => PaymentPage());
                                  // },
                                  title: CommonWidgets().textWidget(
                                      text: "Payment",
                                      textSize: 14.0,
                                      textWeight: FontWeight.w600),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                  ),
                                ),
                                Divider(),
                                ListTile(
                                  leading: Icon(Icons.support_agent_outlined),
                                  contentPadding: EdgeInsets.zero,
                                  minTileHeight: 0,
                                  // onTap: () {
                                  //   Get.to(() => SupportPage());
                                  // },
                                  title: CommonWidgets().textWidget(
                                      text: "Support",
                                      textSize: 14.0,
                                      textWeight: FontWeight.w600),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            width: Get.width * 0.9,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Icon(Icons.feed_outlined),
                                  contentPadding: EdgeInsets.zero,
                                  minTileHeight: 0,
                                  // onTap: () {
                                  //   Get.to(() => TearmsPage());
                                  // },
                                  title: CommonWidgets().textWidget(
                                      text: "Tearms & Conditions",
                                      textSize: 14.0,
                                      textWeight: FontWeight.w600),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                  ),
                                ),
                                Divider(),
                                ListTile(
                                  leading: Icon(Icons.feed_outlined),
                                  contentPadding: EdgeInsets.zero,
                                  minTileHeight: 0,
                                  // onTap: () {
                                  //   Get.to(() => PolicyPage());
                                  // },
                                  title: CommonWidgets().textWidget(
                                      text: "Privacy Policy",
                                      textSize: 14.0,
                                      textWeight: FontWeight.w600),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            width: Get.width * 0.9,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Icon(Icons.person_off_outlined),
                                  contentPadding: EdgeInsets.zero,
                                  minTileHeight: 0,
                                  // onTap: () {
                                  //   Get.to(() => DeleteAccountPage());
                                  // },
                                  title: CommonWidgets().textWidget(
                                      text: "Delete Account",
                                      textSize: 14.0,
                                      textWeight: FontWeight.w600),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                  ),
                                ),
                                Divider(),
                                ListTile(
                                  leading: Icon(Icons.logout_outlined),
                                  contentPadding: EdgeInsets.zero,
                                  minTileHeight: 0,
                                  onTap: () => showAlertDialog(context),
                                  title: CommonWidgets().textWidget(
                                      text: "Logout",
                                      textSize: 14.0,
                                      textWeight: FontWeight.w600),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: Get.height * 0.13)
                        ],
                      ),
                    )
                  : CommonWidgets().loader(),
            ],
          ),
        ),
      ),
    );
  }
}
