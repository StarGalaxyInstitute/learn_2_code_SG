// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, use_key_in_widget_constructors, must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:learn_to_code/Constrant/common_widgets.dart';
import 'package:learn_to_code/Constrant/utilities.dart';
import 'package:lottie/lottie.dart';

import '../Controllers/parents_home_controller.dart';
import 'parent_progresschart_screen.dart';
import 'parents_attendance_screen.dart';
import 'parents_profile_screen.dart';
import 'parents_results_screen.dart';

class ParentsHomepage extends StatelessWidget {
  ParentsHomeController controller = Get.put(ParentsHomeController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return CommonWidgets().willpopdialog();
          },
        );
        return shouldPop!;
      },
      child: Scaffold(
        appBar: AppBar(
            title: CommonWidgets().textWidget(
          text: "SGI Parents",
          textWeight: FontWeight.bold,
          textSize: 20.0,
        )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Lottie.asset(AppImage.images + "learn.json", height: 160),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: StaggeredGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  children: [
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1.5,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(ParentsResultsScreen());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue.shade100,
                              border: Border.all(width: 2, color: Colors.blue),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.blue,
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Image.asset(
                                    color: AppColors.whitecolor,
                                    AppImage.images + "result.png",
                                    width: 70,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              CommonWidgets().textWidget(
                                text: "Result",
                                textColor: AppColors.blackcolor,
                                textWeight: FontWeight.bold,
                                textSize: 20.0,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(ParentsAttendanceScreen());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.teal.shade100,
                              border: Border.all(width: 2, color: Colors.teal),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.teal,
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Image.asset(
                                    color: AppColors.whitecolor,
                                    AppImage.images + "attendance.png",
                                    width: 70,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              CommonWidgets().textWidget(
                                text: "Attendance",
                                textColor: AppColors.blackcolor,
                                textWeight: FontWeight.bold,
                                textSize: 20.0,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1.5,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(ParentProgresschartScreen());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.deepPurple.shade100,
                              border:
                                  Border.all(width: 2, color: Colors.deepPurple),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.deepPurple,
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Image.asset(
                                    color: AppColors.whitecolor,
                                    AppImage.images + "progress.png",
                                    width: 70,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              CommonWidgets().textWidget(
                                text: "Progress",
                                textColor: AppColors.blackcolor,
                                textWeight: FontWeight.bold,
                                textSize: 20.0,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(ParentsProfileScreen());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.amber.shade100,
                              border: Border.all(width: 2, color: Colors.amber),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.amber,
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Image.asset(
                                    color: AppColors.whitecolor,
                                    AppImage.images + "user.png",
                                    width: 70,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              CommonWidgets().textWidget(
                                text: "Profile",
                                textColor: AppColors.blackcolor,
                                textWeight: FontWeight.bold,
                                textSize: 20.0,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
