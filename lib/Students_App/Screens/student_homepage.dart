// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, avoid_unnecessary_containers, prefer_interpolation_to_compose_strings, prefer_final_fields, unused_field, use_key_in_widget_constructors, must_be_immutable

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_to_code/Constrant/common_widgets.dart';
import 'package:learn_to_code/Constrant/utilities.dart';
import 'package:learn_to_code/Students_App/Controllers/student_homecontroller.dart';
import '../Controllers/student_toplivetutor_controller.dart';
import 'student_filtercoures_result.dart';
import 'student_filtertutor_screen.dart';
import 'student_livesubject_tutoringlist.dart';
import 'student_livetutor_personaldetailsscreen.dart';
import 'student_weeklytoplive_tutorsListscreen.dart';

class StudentHomepage extends StatelessWidget {
  StudentHomecontroller _studentHomecontroller =
      Get.put(StudentHomecontroller());
  final StudentToplivetutorController tutorController =
      Get.put(StudentToplivetutorController());

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
                                    textSize: 15.0,
                                    textAlign: TextAlign.center,
                                    textWeight: FontWeight.bold),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(
                                        () => StudentLiveSubjectTutoringList());
                                  },
                                  child: CommonWidgets().textWidget(
                                      text: "View All >",
                                      textSize: 11.0,
                                      textAlign: TextAlign.center,
                                      textWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            SizedBox(height: Get.height * 0.01),
                            SizedBox(
                              height: 80,
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
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => StudentFiltercouresresult());
                                  },
                                  child: CommonWidgets().textWidget(
                                      text: "All Courses >",
                                      textSize: 11.0,
                                      textAlign: TextAlign.center,
                                      textWeight: FontWeight.w500),
                                ),
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
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() =>
                                        StudentWeeklyTopLiveTutorsListScreen());
                                  },
                                  child: CommonWidgets().textWidget(
                                      text: "All Tutors >",
                                      textSize: 11.0,
                                      textAlign: TextAlign.center,
                                      textWeight: FontWeight.w500),
                                ),
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
                                  final tutor = tutorController.tutors[index];
                                  return GestureDetector(
                                    onTap: () {
                                      tutorController.selectTutor(tutor);
                                      Get.to(() =>
                                          StudentLiveTutorPersonalDetailsScreen());
                                    },
                                    child: topLiveTutor(
                                        name: tutor.name,
                                        subject: tutor.subject),
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
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => StudentFiltercouresresult());
                                  },
                                  child: CommonWidgets().textWidget(
                                      text: "All Courses >",
                                      textSize: 11.0,
                                      textAlign: TextAlign.center,
                                      textWeight: FontWeight.w500),
                                ),
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
          border: Border.all(color: AppColors.btnborder),
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
              color: AppColors.btnborder,
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
      width: 120,
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
              .withOpacity(.5),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.menu_book_rounded,
            size: 20,
            color: AppColors.blackcolor,
          ),
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

  Widget topLiveTutor({name, subject}) {
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
              text: name,
              textSize: 15.0,
              textColor: AppColors.blackcolor,
              textAlign: TextAlign.start,
              textWeight: FontWeight.bold),
          CommonWidgets().textWidget(
              text: subject,
              textSize: 12.0,
              textColor: AppColors.blackcolor,
              textAlign: TextAlign.start,
              textWeight: FontWeight.w500),
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
