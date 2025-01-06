// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constrant/common_widgets.dart';
import '../../Constrant/utilities.dart';
import '../Controllers/student_filtertutor_resultcontroller.dart';
import '../Helpers/student_tutormodel.dart';

class StudentFiltertutorResult extends StatelessWidget {
  final StudentFiltertutorresultcontroller controller =
      Get.put(StudentFiltertutorresultcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: CommonWidgets().textWidget(
            text: 'Filtered Results',
            textAlign: TextAlign.start,
            textSize: 16.0,
            textWeight: FontWeight.bold),
        elevation: 0,
        centerTitle: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: searchWidget(),
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: controller.tutors.length,
                itemBuilder: (context, index) {
                  final tutor = controller.tutors[index];
                  return TutorCard(tutor: tutor);
                },
              );
            }),
          ),
        ],
      ),
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
          Spacer(),
          Container(
            width: 1,
            color: AppColors.btnborder,
            height: 50,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.filter_list, color: Colors.grey),
                SizedBox(width: 5),
                CommonWidgets().textWidget(
                    text: '5 Filters',
                    textColor: AppColors.greycolor,
                    textAlign: TextAlign.center,
                    textWeight: FontWeight.bold),
              ],
            ),
          ),
        ],
      ));
}

class TutorCard extends StatelessWidget {
  final StudentTutormodel tutor;

  const TutorCard({required this.tutor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 13, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: AppColors.btnborder),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(
                tutor.image,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonWidgets().textWidget(
                      text: tutor.name,
                      textSize: 15.0,
                      textAlign: TextAlign.start,
                      textWeight: FontWeight.bold),
                  SizedBox(width: 6),
                  CommonWidgets().textWidget(
                      text: tutor.university,
                      textSize: 13.0,
                      textColor: AppColors.greycolor,
                      textAlign: TextAlign.start,
                      textWeight: FontWeight.w400),
                  SizedBox(width: 6),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 16),
                      SizedBox(width: 4),
                      CommonWidgets().textWidget(
                          text: '${tutor.rating} (${tutor.reviews})',
                          textColor: AppColors.greycolor,
                          textSize: 12.0,
                          textAlign: TextAlign.start,
                          textWeight: FontWeight.w500),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CommonWidgets().textWidget(
                    text: '\$${tutor.hourlyRate}/hr',
                    textColor: AppColors.btnBlue,
                    textAlign: TextAlign.start,
                    textSize: 15.0,
                    textWeight: FontWeight.w500),
                CommonWidgets().textWidget(
                    text: '\$${tutor.oldRate}',
                    textColor: AppColors.greycolor,
                    textSize: 13.0,
                    textAlign: TextAlign.start,
                    textWeight: FontWeight.w500),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
