// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, avoid_unnecessary_containers, prefer_interpolation_to_compose_strings, prefer_final_fields, unused_field, use_key_in_widget_constructors, must_be_immutable

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_to_code/Constrant/common_widgets.dart';
import 'package:learn_to_code/Constrant/utilities.dart';
import 'package:learn_to_code/Students_App/Controllers/student_homecontroller.dart';
import 'student_filtertutor_screen.dart';

class StudentHomepage extends StatelessWidget {
  StudentHomecontroller _studentHomecontroller =
      Get.put(StudentHomecontroller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
          body: Stack(
            children: [
              _studentHomecontroller.isLoader.value
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: Get.height * 0.02),
                            CommonWidgets().textWidget(
                                text: "Learn2Code",
                                textSize: 20.0,
                                textWeight: FontWeight.w600),
                            SizedBox(height: Get.height * 0.02),
                            searchWidget(),
                            SizedBox(height: Get.height * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CommonWidgets().textWidget(
                                    text: "Live Subject Tutoring",
                                    textSize: 16.0,
                                    textAlign: TextAlign.center,
                                    textWeight: FontWeight.w600),
                                CommonWidgets().textWidget(
                                    text: "View All>",
                                    textSize: 12.0,
                                    textAlign: TextAlign.center,
                                    textWeight: FontWeight.w500),
                              ],
                            ),
                            SizedBox(height: Get.height * 0.01),
                            SizedBox(
                              height: 70,
                              width: Get.width,
                              child: ListView.builder(
                                itemCount: 5,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    // onTap: () {
                                    //   Get.to(() => FilterScreen());
                                    // },
                                    child: liveTutorWidget(
                                        subjectName: "Flutter",
                                        subjectLessons: "20 Lessons"),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: Get.height * 0.01),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CommonWidgets().textWidget(
                                    text: "Trending Course",
                                    textSize: 16.0,
                                    textAlign: TextAlign.center,
                                    textWeight: FontWeight.w600),
                                CommonWidgets().textWidget(
                                    text: "All Courses>",
                                    textSize: 12.0,
                                    textAlign: TextAlign.center,
                                    textWeight: FontWeight.w500),
                              ],
                            ),
                            SizedBox(height: Get.height * 0.01),
                            SizedBox(
                              height: 220,
                              width: Get.width,
                              child: ListView.builder(
                                itemCount: 5,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    // onTap: () {
                                    //   Get.to(() => CourseDetailPage());
                                    // },
                                    child: trendingCourseWidget(),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: Get.height * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CommonWidgets().textWidget(
                                    text: "Weekly Top Live Tutors",
                                    textSize: 16.0,
                                    textAlign: TextAlign.center,
                                    textWeight: FontWeight.w600),
                                CommonWidgets().textWidget(
                                    text: "All Tutors>",
                                    textSize: 12.0,
                                    textAlign: TextAlign.center,
                                    textWeight: FontWeight.w500),
                              ],
                            ),
                            SizedBox(height: Get.height * 0.01),
                            SizedBox(
                              height: 150,
                              width: Get.width,
                              child: ListView.builder(
                                itemCount: 5,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    // onTap: () {
                                    //   Get.to(TutorsDetailsPage());
                                    // },
                                    child: topLiveTutor(),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: Get.height * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CommonWidgets().textWidget(
                                    text: "Top New Courses",
                                    textSize: 16.0,
                                    textAlign: TextAlign.center,
                                    textWeight: FontWeight.w600),
                                CommonWidgets().textWidget(
                                    text: "All Courses>",
                                    textSize: 12.0,
                                    textAlign: TextAlign.center,
                                    textWeight: FontWeight.w500),
                              ],
                            ),
                            SizedBox(height: Get.height * 0.01),
                            SizedBox(
                              height: 220,
                              width: Get.width,
                              child: ListView.builder(
                                itemCount: 5,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    // onTap: () {
                                    //   Get.to(() => CourseDetailPage());
                                    // },
                                    child: topNewCourses(),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: Get.height * 0.13)
                          ],
                        ),
                      ),
                    )
                  : CommonWidgets().loader(),
            ],
          ),
        ),
      ),
    );
  }

  Widget searchWidget() {
    return Container(
        height: 50,
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.greycolor),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: TextFormField(
                keyboardType: TextInputType.streetAddress,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                  hintStyle: GoogleFonts.abyssinicaSil(),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Container(
              width: 1,
              color: AppColors.greycolor,
              height: 50,
            ),
            Expanded(
                child: GestureDetector(
              onTap: () {
                Get.to(() => StudentFiltertutorScreen());
              },
              child: Icon(
                Icons.filter_list_sharp,
                color: AppColors.blackcolor,
              ),
            )),
          ],
        ));
  }

  Widget liveTutorWidget({subjectName, subjectLessons}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
              .withOpacity(.8),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonWidgets().textWidget(
              text: subjectName, textSize: 15.0, textWeight: FontWeight.w600),
          SizedBox(height: 10),
          CommonWidgets().textWidget(
              text: subjectLessons,
              textSize: 12.0,
              textWeight: FontWeight.w400),
        ],
      ),
    );
  }

  Widget trendingCourseWidget() {
    return Container(
      width: Get.width * 0.45,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
              .withOpacity(.2),
          // color: AppColors.greyColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            width: Get.width,
            margin: EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_rpCV_Esm0MpYTJEy8d5XqtzEDUFre-D_1g&s"),
                    fit: BoxFit.cover)),
          ),
          CommonWidgets().textWidget(
              text: "Advanced Front-End Programming Techniques",
              textSize: 14.0,
              textmaxLine: 2,
              textoverFlow: TextOverflow.ellipsis,
              textWeight: FontWeight.w600),
          CommonWidgets().textWidget(
              text: "Julia Anatole · 1 hr",
              textSize: 12.0,
              textWeight: FontWeight.w400),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonWidgets().textWidget(
                  text: "\$12.99", textSize: 14.0, textWeight: FontWeight.w600),
              CommonWidgets().textWidget(
                  text: "⭐4.5 (2,980)",
                  textSize: 12.0,
                  textWeight: FontWeight.w400),
            ],
          )
        ],
      ),
    );
  }

  Widget topLiveTutor() {
    return Container(
      width: Get.width * 0.4,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
              .withOpacity(.2),
          // border: Border.all(
          //   width: 2,
          //   color: AppColors.greyColor.withOpacity(0.5),
          // ),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_rpCV_Esm0MpYTJEy8d5XqtzEDUFre-D_1g&s"),
          ),
          CommonWidgets().textWidget(
              text: "Albert Flores",
              textSize: 15.0,
              textWeight: FontWeight.w700),
          CommonWidgets().textWidget(
              text: "Math 116", textSize: 12.0, textWeight: FontWeight.w500),
        ],
      ),
    );
  }

  Widget topNewCourses() {
    return Container(
      width: Get.width * 0.45,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
              .withOpacity(.2),
          // color: AppColors.greyColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            width: Get.width,
            margin: EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
                color: AppColors.greycolor,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_rpCV_Esm0MpYTJEy8d5XqtzEDUFre-D_1g&s"),
                    fit: BoxFit.cover)),
          ),
          CommonWidgets().textWidget(
              text: "Advanced Front-End Programming Techniques",
              textSize: 14.0,
              textmaxLine: 2,
              textoverFlow: TextOverflow.ellipsis,
              textWeight: FontWeight.w600),
          CommonWidgets().textWidget(
              text: "Julia Anatole · 1 hr",
              textSize: 12.0,
              textWeight: FontWeight.w400),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonWidgets().textWidget(
                  text: "\$12.99", textSize: 14.0, textWeight: FontWeight.w600),
              CommonWidgets().textWidget(
                  text: "⭐4.5 (2,980)",
                  textSize: 12.0,
                  textWeight: FontWeight.w400),
            ],
          )
        ],
      ),
    );
  }
}
