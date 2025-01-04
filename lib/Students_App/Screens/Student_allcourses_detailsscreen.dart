// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_intro/flutter_carousel_intro.dart';
import 'package:flutter_carousel_intro/slider_item_model.dart';
import 'package:flutter_carousel_intro/utils/enums.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:learn_to_code/Constrant/utilities.dart';
import 'package:learn_to_code/Students_App/Controllers/student_allcoureseslist_controller.dart';
import '../../Constrant/common_widgets.dart';

final StudentAllcoureseslistController controller =
    Get.put(StudentAllcoureseslistController());

class StudentAllCoursesDetailsScreen extends StatelessWidget {
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
            : SingleChildScrollView(
                child: Padding(
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
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                controller.selectedIndex.value = 0;
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 7),
                                padding: EdgeInsets.all(10),
                                decoration: controller.selectedIndex.value == 0
                                    ? BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: AppColors.btnBlue)
                                    : BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: AppColors.btnBluelight),
                                child: CommonWidgets().textWidget(
                                    text: 'About',
                                    textSize: 14.0,
                                    textColor:
                                        controller.selectedIndex.value == 0
                                            ? AppColors.whitecolor
                                            : Colors.grey,
                                    textAlign: TextAlign.center,
                                    textWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                controller.selectedIndex.value = 1;
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 7),
                                padding: EdgeInsets.all(10),
                                decoration: controller.selectedIndex.value == 1
                                    ? BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: AppColors.btnBlue)
                                    : BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: AppColors.btnBluelight),
                                child: CommonWidgets().textWidget(
                                    text: 'Reviews',
                                    textSize: 14.0,
                                    textColor:
                                        controller.selectedIndex.value == 1
                                            ? AppColors.whitecolor
                                            : Colors.grey,
                                    textAlign: TextAlign.center,
                                    textWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                controller.selectedIndex.value = 2;
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: controller.selectedIndex.value == 2
                                    ? BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: AppColors.btnBlue)
                                    : BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: AppColors.btnBluelight),
                                child: CommonWidgets().textWidget(
                                    text: 'Author',
                                    textSize: 14.0,
                                    textColor:
                                        controller.selectedIndex.value == 2
                                            ? AppColors.whitecolor
                                            : Colors.grey,
                                    textAlign: TextAlign.center,
                                    textWeight: FontWeight.bold),
                              ),
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
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

Widget About() {
  return Container(
    margin: EdgeInsets.all(5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        CommonWidgets().textWidget(
            text: 'What this Course Includes',
            textSize: 15.0,
            textAlign: TextAlign.start,
            textWeight: FontWeight.w600),
        SizedBox(
          height: 10,
        ),
        CarouselSlider.builder(
          options: CarouselOptions(
              autoPlay: true, aspectRatio: 16 / 2.5, enlargeCenterPage: true),
          itemCount: controller.iconlist.length,
          itemBuilder: (BuildContext context, int index, int pageViewIndex) {
            final course = controller.iconlist[index];
            return Container(
              decoration: BoxDecoration(
                color: AppColors.btnBluelight,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: course.icon,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CommonWidgets().textWidget(
                      text: course.name,
                      textSize: 12.0,
                      textColor: AppColors.blackcolor,
                      textAlign: TextAlign.start,
                      textWeight: FontWeight.w500),
                ],
              ),
            );
          },
        ),
        SizedBox(
          height: 10,
        ),
        CommonWidgets().textWidget(
            text: 'Course Materials',
            textSize: 15.0,
            textAlign: TextAlign.start,
            textWeight: FontWeight.w600),
        SizedBox(
          height: 10,
        ),
        ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: controller.coursemateriallist.length,
          itemBuilder: (context, index) {
            final course = controller.coursemateriallist[index];
            return CardItem(
                leading: course.icon, name: course.name, time: course.time);
          },
        ),
      ],
    ),
  );
}

Widget CardItem({leading, name, time}) {
  return Container(
    height: 50,
    margin: EdgeInsets.symmetric(vertical: 6),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.greycolor)),
    child: ListTile(
      leading: leading,
      title: CommonWidgets().textWidget(
          text: name,
          textSize: 13.0,
          textmaxLine: 1,
          textoverFlow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
          textWeight: FontWeight.w600),
      trailing: CommonWidgets().textWidget(
          text: time,
          textSize: 13.0,
          textColor: AppColors.btnBlue,
          textAlign: TextAlign.start,
          textWeight: FontWeight.w500),
    ),
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
