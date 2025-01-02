// ignore_for_file: prefer_const_constructors, unnecessary_brace_in_string_interps, use_key_in_widget_constructors, file_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_to_code/Constrant/utilities.dart';

import '../../Constrant/common_widgets.dart';
import '../Controllers/student_toplivetutor_controller.dart';
import 'student_livetutor_personaldetailsscreen.dart';

class StudentWeeklyTopLiveTutorsListScreen extends StatelessWidget {
  final StudentToplivetutorController tutorController =
      Get.put(StudentToplivetutorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CommonWidgets().textWidget(
            text: 'All Tutors',
            textSize: 17.0,
            textAlign: TextAlign.start,
            textWeight: FontWeight.bold),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course Image
            Container(
              margin: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_rpCV_Esm0MpYTJEy8d5XqtzEDUFre-D_1g&s', // Replace with actual image URL
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity,
                    ),
                  ),
                  SizedBox(height: 16),
                  CommonWidgets().textWidget(
                      text: "ARCH116 - Introduction to Architecture",
                      textSize: 17.0,
                      textAlign: TextAlign.start,
                      textWeight: FontWeight.bold),
                  SizedBox(height: 8),
                  CommonWidgets().textWidget(
                      text:
                          "ARCH116 bridges foundational mathematics with architectural design, covering algebra, functions, and basic geometry for aspiring architects.",
                      textSize: 13.0,
                      textColor: AppColors.greycolor,
                      textAlign: TextAlign.start,
                      textWeight: FontWeight.w600),
                ],
              ),
            ),
            // Available Tutors
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 15),
              child: CommonWidgets().textWidget(
                  text: "5 Available Tutors",
                  textSize: 16.0,
                  textAlign: TextAlign.start,
                  textWeight: FontWeight.bold),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: tutorController.tutors.length,
              itemBuilder: (context, index) {
                final tutor = tutorController.tutors[index];
                return GestureDetector(
                  onTap: () {
                    tutorController.selectTutor(tutor);
                    Get.to(() => StudentLiveTutorPersonalDetailsScreen());
                  },
                  child: liveTutorWidget(
                      name: tutor.name,
                      university: tutor.university,
                      discountedRate: tutor.discountedRate,
                      hourlyRate: tutor.hourlyRate,
                      rating: tutor.rating,
                      reviewscount: tutor.reviewscount),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget liveTutorWidget(
    {name, university, rating, reviewscount, hourlyRate, discountedRate}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 13, vertical: 8),
    padding: EdgeInsets.all(11),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.greycolor)),
    child: Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_rpCV_Esm0MpYTJEy8d5XqtzEDUFre-D_1g&s'), // Replace with avatar image URL
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonWidgets().textWidget(
                  text: name,
                  textSize: 15.0,
                  textAlign: TextAlign.start,
                  textWeight: FontWeight.bold),
              CommonWidgets().textWidget(
                  text: university,
                  textSize: 13.0,
                  textColor: AppColors.greycolor,
                  textAlign: TextAlign.start,
                  textWeight: FontWeight.w500),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 16,
                  ),
                  SizedBox(width: 4),
                  CommonWidgets().textWidget(
                      text: '${rating} (${reviewscount})',
                      textSize: 14.0,
                      textColor: AppColors.greycolor,
                      textAlign: TextAlign.start,
                      textWeight: FontWeight.w600),
                ],
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CommonWidgets().textWidget(
                text: '\$${hourlyRate}/hr',
                textSize: 13.0,
                textColor: AppColors.btnBlue,
                textAlign: TextAlign.start,
                textWeight: FontWeight.bold),
            CommonWidgets().textWidget(
                text: '\$${discountedRate}',
                textSize: 11.0,
                textColor: AppColors.greycolor,
                textdecoration: TextDecoration.lineThrough,
                textAlign: TextAlign.start,
                textWeight: FontWeight.w500),
          ],
        ),
      ],
    ),
  );
}
