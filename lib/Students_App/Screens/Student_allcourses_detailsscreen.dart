// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:learn_to_code/Constrant/utilities.dart';
import 'package:learn_to_code/Students_App/Controllers/student_allcoureseslist_controller.dart';
import '../../Constrant/common_widgets.dart';

// class StudentAllCoursesDetailsScreen extends StatefulWidget {
//   @override
//   State<StudentAllCoursesDetailsScreen> createState() =>
//       _StudentAllCoursesDetailsScreenState();
// }

class StudentAllCoursesDetailsScreen extends StatelessWidget {
  final StudentAllcoureseslistController controller =
      Get.put(StudentAllcoureseslistController());

  @override
  Widget build(BuildContext context) {
    final course = controller.selectedTutor.value;
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: CommonWidgets().textWidget(
              text: 'About Courses',
              textSize: 16.0,
              textAlign: TextAlign.start,
              textWeight: FontWeight.bold),
        ),
        body: course == null
            ? Center(
                child: CommonWidgets().textWidget(
                    text: "No Courses selected",
                    textSize: 16.0,
                    textAlign: TextAlign.start,
                    textWeight: FontWeight.bold),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        course.image,
                        fit: BoxFit.cover,
                        height: 160,
                        width: double.infinity,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CommonWidgets().textWidget(
                        text: course.title,
                        textSize: 15.0,
                        textAlign: TextAlign.start,
                        textWeight: FontWeight.bold),
                    CommonWidgets().textWidget(
                        text: course.author,
                        textSize: 13.0,
                        textColor: AppColors.greycolor,
                        textAlign: TextAlign.start,
                        textWeight: FontWeight.w500),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (course.tag.isNotEmpty)
                          Container(
                            margin: EdgeInsets.only(top: 6),
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: course.tag == 'Top Author'
                                  ? Colors.purple[100]
                                  : Colors.green[100],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: CommonWidgets().textWidget(
                                text: course.tag,
                                textSize: 11.0,
                                textColor: AppColors.blackcolor,
                                textAlign: TextAlign.start,
                                textWeight: FontWeight.w400),
                          ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 16,
                            ),
                            SizedBox(width: 4),
                            CommonWidgets().textWidget(
                                text: course.rating,
                                textSize: 14.0,
                                textColor: AppColors.greycolor,
                                textAlign: TextAlign.start,
                                textWeight: FontWeight.w600),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CommonWidgets().textWidget(
                        text: course.details,
                        textSize: 11.0,
                        textColor: AppColors.greycolor,
                        textAlign: TextAlign.start,
                        textWeight: FontWeight.w500),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.selectedIndex.value = 0;
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            color: AppColors.btnBlue,
                            child: Text("About"),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.selectedIndex.value = 1;
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            color: AppColors.btnBlue,
                            child: Text("Reviews"),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.selectedIndex.value = 2;
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            color: AppColors.btnBlue,
                            child: Text("Author"),
                          ),
                        ),
                      ],
                    ),

                    if (controller.selectedIndex.value == 0)
                      About()
                    else if (controller.selectedIndex.value == 1)
                      Reviews()
                    else
                      Author()
                    // Container(
                    //   child: Index == 0?About: Index == 0?Reviews: Author

                    // )
                  ],
                ),
              ),
      ),
    );
  }
}

Widget About() {
  return Container(
    margin: EdgeInsets.all(10),
    height: 50,
    color: Colors.amber,
  );
}

Widget Reviews() {
  return Container(
    margin: EdgeInsets.all(10),
    height: 50,
    color: Colors.deepOrange,
  );
}

Widget Author() {
  return Container(
    margin: EdgeInsets.all(10),
    height: 50,
    color: Colors.blue,
  );
}
