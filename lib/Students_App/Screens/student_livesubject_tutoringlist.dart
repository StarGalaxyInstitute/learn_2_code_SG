// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_to_code/Constrant/common_widgets.dart';
import 'package:learn_to_code/Constrant/utilities.dart';

import '../Controllers/student_livesubject_tutoring_controller.dart';
import 'student_request_newsubjectscreen.dart';

class StudentLiveSubjectTutoringList extends StatelessWidget {
  StudentLivesubjectTutoringController controller =
      Get.put(StudentLivesubjectTutoringController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: () {
                Get.to(StudentRequestNewSubjectScreen());
              },
              child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.btnBlue,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_circle_outline,
                        color: AppColors.whitecolor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CommonWidgets().textWidget(
                          text: 'Request New Subject',
                          textAlign: TextAlign.start,
                          textSize: 16.0,
                          textColor: AppColors.whitecolor,
                          textWeight: FontWeight.bold),
                    ],
                  )),
            ),
          ),
          appBar: AppBar(
            title: CommonWidgets().textWidget(
                text: 'Live Tutoring',
                textAlign: TextAlign.start,
                textSize: 16.0,
                textWeight: FontWeight.bold),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: searchWidget(),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 6, left: 13, right: 10),
                  child: CommonWidgets().textWidget(
                      text: "All Live Subject Tutoring",
                      textSize: 13.0,
                      textWeight: FontWeight.bold),
                ),
                GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  itemCount: 8,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      // onTap: () {
                      //   Get.to(() => FilterScreen());
                      // },
                      child: liveTutorWidget(
                          subjectName: "Flutter",
                          subjectLessons: "Mat 116",
                          tutor: "19 Tutor"),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 100, crossAxisCount: 2),
                ),
              ],
            ),
          )),
    );
  }
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
              // Get.to(() => StudentFiltertutorScreen());
            },
            child: Icon(
              Icons.filter_list_sharp,
            ),
          )),
        ],
      ));
}

Widget liveTutorWidget({subjectName, subjectLessons, tutor}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    margin: EdgeInsets.all(5),
    decoration: BoxDecoration(
        color: Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
            .withOpacity(.2),
        borderRadius: BorderRadius.circular(10)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 10),
        Icon(
          Icons.menu_book_outlined,
          size: 30,
        ),
        Spacer(),
        Row(
          children: [
            CommonWidgets().textWidget(
                text: subjectLessons,
                textSize: 13.0,
                textWeight: FontWeight.w800),
            SizedBox(width: 10),
            CommonWidgets().textWidget(
                text: tutor, textSize: 12.0, textWeight: FontWeight.w400),
          ],
        ),
        SizedBox(height: 10),
      ],
    ),
  );
}
