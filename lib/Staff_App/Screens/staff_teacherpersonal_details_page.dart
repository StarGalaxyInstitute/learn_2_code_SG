// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constrant/common_widgets.dart';
import '../Controllers/staff_teacherslist_controller.dart';

class StaffTeacherpersonalDetailsPage extends StatelessWidget {
  String name;
  String subject;
  String location;
  String subjects;
  String rating;
  String reviews;
  String salary;
  String graduation;
  String about;

  StaffTeacherpersonalDetailsPage(
      {required this.name,
      required this.subject,
      required this.location,
      required this.subjects,
      required this.rating,
      required this.reviews,
      required this.salary,
      required this.graduation,
      required this.about,
    });

  final StaffTeacherslistController teacherController =
      Get.put(StaffTeacherslistController());

  @override
  Widget build(BuildContext context) {
    // final tutor = teacherController.selectedTutor.value;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: CommonWidgets().textWidget(
            text: 'Teacher Details',
            textSize: 17.0,
            textAlign: TextAlign.start,
            textWeight: FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Teacher Image
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_rpCV_Esm0MpYTJEy8d5XqtzEDUFre-D_1g&s",
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),

              // Name and Salary
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonWidgets().textWidget(
                          text: name,
                          textSize: 17.0,
                          textAlign: TextAlign.start,
                          textWeight: FontWeight.bold),
                      Row(
                        children: [
                          const Icon(Icons.star,
                              color: Colors.orange, size: 18.0),
                          CommonWidgets().textWidget(
                              text:
                                  '${rating} (${reviews} Reviews)',
                              textSize: 14.0,
                              textAlign: TextAlign.start,
                              textWeight: FontWeight.w400),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CommonWidgets().textWidget(
                          text: 'Salary',
                          textSize: 15.0,
                          textAlign: TextAlign.start,
                          textWeight: FontWeight.bold),
                      CommonWidgets().textWidget(
                          text: '${salary} Tk',
                          textSize: 13.0,
                          textAlign: TextAlign.start,
                          textWeight: FontWeight.w400),
                    ],
                  )
                ],
              ),

              const SizedBox(height: 16.0),

              // Subjects and Graduation
              Row(
                children: [
                  const Icon(Icons.book, size: 18.0, color: Colors.grey),
                  const SizedBox(width: 8.0),
                  CommonWidgets().textWidget(
                      text: subject,
                      textSize: 13.0,
                      textAlign: TextAlign.start,
                      textWeight: FontWeight.bold),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  const Icon(Icons.school, size: 18.0, color: Colors.grey),
                  const SizedBox(width: 8.0),
                  CommonWidgets().textWidget(
                      text: graduation,
                      textSize: 13.0,
                      textAlign: TextAlign.start,
                      textWeight: FontWeight.bold),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  const Icon(Icons.location_on, size: 18.0, color: Colors.grey),
                  const SizedBox(width: 8.0),
                  CommonWidgets().textWidget(
                      text: location,
                      textSize: 13.0,
                      textAlign: TextAlign.start,
                      textWeight: FontWeight.bold),
                ],
              ),

              const SizedBox(height: 16.0),

              // About Section
              CommonWidgets().textWidget(
                  text: 'About',
                  textSize: 15.0,
                  textAlign: TextAlign.start,
                  textWeight: FontWeight.bold),

              const SizedBox(height: 8.0),
              CommonWidgets().textWidget(
                  text: about,
                  textSize: 13.0,
                  textAlign: TextAlign.start,
                  textWeight: FontWeight.w500),

              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
