// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_to_code/Constrant/utilities.dart';

import '../../Constrant/common_widgets.dart';
import '../Controllers/staff_courses_controller.dart';

class StaffAllcoursesScreen extends StatelessWidget {
  final StaffCoursesController controller = Get.put(StaffCoursesController());

  @override
  Widget build(BuildContext context) {
    final Cours = controller.courses.value;
    return Scaffold(
      appBar: AppBar(
           backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: CommonWidgets().textWidget(
            text: 'My Courses',
            textSize: 17.0,
            textAlign: TextAlign.start,
            textWeight: FontWeight.bold),
      ),
      body: Column(
        children: [
          // Add New Course Button
          InkWell(
            onTap: () {
              // Action to add a new course
            },
            child: Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.btnBluelight,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.btnBlue),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, size: 30, color: AppColors.btnBlue),
                  SizedBox(height: 8),
                  CommonWidgets().textWidget(
                      text: 'Add a new course',
                      textSize: 15.0,
                      textColor: AppColors.btnBlue,
                      textAlign: TextAlign.start,
                      textWeight: FontWeight.bold),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          // Course Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: GridView.builder(
                itemCount: controller.courses.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final course = controller.courses[index];
                  return _buildCourses(
                    title: course.title,
                    classes: course.classes,
                    details: course.details,
                    icon: course.icon,
                    duration: course.duration,
                    color: course.color,
                    colorbg: course.colorbg,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourses(
      {title, classes, details, icon, duration, color, colorbg}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.all(1),
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  CommonWidgets().textWidget(
                      text: title,
                      textSize: 12.0,
                      textColor: AppColors.blackcolor,
                      textmaxLine: 2,
                      textoverFlow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      textWeight: FontWeight.bold),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonWidgets().textWidget(
                                text: classes,
                                textSize: 9.0,
                                textmaxLine: 1,
                                textColor: AppColors.greycolor,
                                textoverFlow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                textWeight: FontWeight.w600),
                            CommonWidgets().textWidget(
                                text: duration,
                                textSize: 9.0,
                                textmaxLine: 1,
                                textColor: AppColors.greycolor,
                                textoverFlow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                textWeight: FontWeight.w600),
                          ],
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        child: CircleAvatar(
                            radius: 20,
                            backgroundColor: colorbg,
                            child: Icon(
                              icon,
                              color: color,
                            )),
                      )
                    ],
                  )
                ],
              )),
          Spacer(),
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.whitecolor),
            width: double.infinity,
            height: 50,
            child: Center(
              child: CommonWidgets().textWidget(
                  text: details,
                  textSize: 11.0,
                  textmaxLine: 2,
                  textColor: AppColors.blackcolor,
                  textoverFlow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  textWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
