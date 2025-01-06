// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../../Constrant/common_widgets.dart';
import '../../Constrant/utilities.dart';
import '../Controllers/student_filtertutor_controller.dart';
import 'student_filtercoures_result.dart';
import 'student_filtertutor_result.dart';

class StudentFiltertutorScreen extends StatefulWidget {
  @override
  State<StudentFiltertutorScreen> createState() =>
      _StudentFiltertutorScreenState();
}

class _StudentFiltertutorScreenState extends State<StudentFiltertutorScreen> {
  final StudentFiltertutorcontroller controller =
      Get.put(StudentFiltertutorcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: CommonWidgets().textWidget(
            text: 'Filters',
            textAlign: TextAlign.start,
            textSize: 17.0,
            textWeight: FontWeight.bold),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Looking For Section
            CommonWidgets().textWidget(
                text: "I'm looking for",
                textAlign: TextAlign.start,
                textSize: 14.0,
                textWeight: FontWeight.bold),

            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        controller.isfilterTab = true;
                      });
                    },
                    child: Container(
                      height: 48,
                      decoration: controller.isfilterTab
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.btnBlue)
                          : BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.btnBluelight),
                      child: Center(
                        child: CommonWidgets().textWidget(
                            text: 'Tutors',
                            textColor: controller.isfilterTab
                                ? AppColors.whitecolor
                                : Colors.grey,
                            textSize: 16.0,
                            textAlign: TextAlign.start,
                            textWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 13),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        controller.isfilterTab = false;
                      });
                    },
                    child: Container(
                      height: 48,
                      decoration: !controller.isfilterTab
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.btnBlue)
                          : BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.btnBluelight),
                      child: Center(
                        child: CommonWidgets().textWidget(
                            text: 'Courses',
                            textAlign: TextAlign.start,
                            textColor: !controller.isfilterTab
                                ? AppColors.whitecolor
                                : Colors.grey,
                            textWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            if (controller.isfilterTab)
              _buildTutorForm()
            else
              _buildCoursesForm(),
          ],
        ),
      ),
    );
  }

  Widget _buildTutorForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        buildDropdown("Subject", controller.selectedSubject,
            ["MAT 116", "MAT 117", "MAT 118"]),
        SizedBox(height: 16),
        CommonWidgets().textWidget(
            text: 'Availability',
            textAlign: TextAlign.start,
            textSize: 14.0,
            textWeight: FontWeight.bold),

        SizedBox(height: 1),
        Obx(() => Wrap(
              spacing: 15,
              children: [
                'Sunday',
                'Monday',
                'Tuesday',
                'Wednesday',
                'Thursday',
                'Friday',
                'Saturday'
              ]
                  .map((day) => ChoiceChip(
                        label: CommonWidgets().textWidget(
                            text: day,
                            textAlign: TextAlign.start,
                            textSize: 13.0,
                            textWeight: FontWeight.w400),
                        selected: controller.selectedDays.contains(day),
                        onSelected: (selected) {
                          if (selected) {
                            controller.selectedDays.add(day);
                          } else {
                            controller.selectedDays.remove(day);
                          }
                        },
                      ))
                  .toList(),
            )),
        SizedBox(height: 16),
        // Timeslots Section
        CommonWidgets().textWidget(
            text: 'Timeslots',
            textAlign: TextAlign.start,
            textSize: 14.0,
            textWeight: FontWeight.bold),

        Obx(() => Wrap(
              spacing: 10,
              children: ['Morning', 'Afternoon', 'Evening']
                  .map((slot) => ChoiceChip(
                        label: CommonWidgets().textWidget(
                            text: slot,
                            textAlign: TextAlign.start,
                            textSize: 13.0,
                            textWeight: FontWeight.w400),
                        selected: controller.selectedTimeslot.value == slot,
                        onSelected: (selected) => controller
                            .selectedTimeslot.value = selected ? slot : '',
                      ))
                  .toList(),
            )),
        SizedBox(height: 16),
        buildDropdown("Tutoring Experience", controller.experience,
            ["1-3 Years", "3-5 Years", "5+ Years"]),
        SizedBox(height: 16),
        buildDropdown("Degrees and certifications", controller.degree, [
          "Master's in Applied Mathematics",
          "Bachelor's in Computer Science"
        ]),
        SizedBox(height: 16),
        CommonWidgets().textWidget(
            text: 'Rating',
            textAlign: TextAlign.start,
            textSize: 14.0,
            textWeight: FontWeight.bold),
        SizedBox(height: 8),
        Ratingstar(),
        const SizedBox(height: 16),
        // Hourly Rate Slider
        CommonWidgets().textWidget(
            text: 'Hourly Rate',
            textAlign: TextAlign.start,
            textSize: 14.0,
            textWeight: FontWeight.bold),

        Obx(() => RangeSlider(
              values: controller.hourlyRate.value,
              min: 0,
              max: 50,
              divisions: 50,
              activeColor: AppColors.darkBlue,
              labels: RangeLabels(
                '\$${controller.hourlyRate.value.start.toInt()}',
                '\$${controller.hourlyRate.value.end.toInt()}',
              ),
              onChanged: (values) => controller.hourlyRate.value = values,
            )),
        const SizedBox(height: 16),
        // Action Buttons
        Row(
          children: [
            Expanded(
                child: GestureDetector(
              onTap: () => controller.resetFilters,
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.btnBlue),
                child: Center(
                  child: CommonWidgets().textWidget(
                      text: 'Reset Filter',
                      textAlign: TextAlign.start,
                      textSize: 14.0,
                      textColor: AppColors.whitecolor,
                      textWeight: FontWeight.bold),
                ),
              ),
            )),
            SizedBox(width: 16),
            Expanded(
                child: GestureDetector(
              onTap: () {
                Get.to(StudentFiltertutorResult());
              },
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.btnBlue),
                child: Center(
                  child: CommonWidgets().textWidget(
                      text: 'Apply Filter',
                      textColor: AppColors.whitecolor,
                      textAlign: TextAlign.start,
                      textSize: 14.0,
                      textWeight: FontWeight.bold),
                ),
              ),
            )),
          ],
        ),
      ],
    );
  }

  Widget _buildCoursesForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildDropdown("Course Category", controller.selectedCategory,
            ["Programming", "Design", "Marketing"]),
        SizedBox(height: 16),
        buildDropdown("Difficulty Level", controller.selectedDifficulty,
            ["Beginner", "Intermediate", "Advanced"]),
        SizedBox(height: 16),
        // Rating Section
        CommonWidgets().textWidget(
            text: 'Rating',
            textAlign: TextAlign.start,
            textSize: 14.0,
            textWeight: FontWeight.bold),

        SizedBox(height: 8),
        Ratingstar(),
        SizedBox(height: 16),
        // Hourly Rate Slider
        CommonWidgets().textWidget(
            text: 'Price Range',
            textAlign: TextAlign.start,
            textSize: 14.0,
            textWeight: FontWeight.bold),

        Obx(() => RangeSlider(
              values: controller.hourlyRate.value,
              min: 0,
              max: 50,
              divisions: 50,
              activeColor: AppColors.darkBlue,
              labels: RangeLabels(
                '\$${controller.hourlyRate.value.start.toInt()}',
                '\$${controller.hourlyRate.value.end.toInt()}',
              ),
              onChanged: (values) => controller.hourlyRate.value = values,
            )),
        SizedBox(height: 16),
        CommonWidgets().textWidget(
            text: 'Duration',
            textAlign: TextAlign.start,
            textSize: 14.0,
            textWeight: FontWeight.bold),

        SizedBox(height: 1),
        Obx(() => Wrap(
              spacing: 10,
              children: ['<1 hr', '1-3 hrs', '3-6 hrs', '6+ hrs']
                  .map((slot) => ChoiceChip(
                        label: CommonWidgets().textWidget(
                            text: slot,
                            textAlign: TextAlign.start,
                            textSize: 13.0,
                            textWeight: FontWeight.w400),
                        selected: controller.selectedTimeslot.value == slot,
                        onSelected: (selected) => controller
                            .selectedTimeslot.value = selected ? slot : '',
                      ))
                  .toList(),
            )),
        SizedBox(height: 16),
        buildDropdown("Released", controller.selectedRelease,
            ["In last 6 Month", "In last Year", "All Time"]),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
                child: GestureDetector(
              onTap: () => controller.resetFilters2,
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.btnBlue),
                child: Center(
                  child: CommonWidgets().textWidget(
                      text: 'Reset Filter',
                      textColor: AppColors.whitecolor,
                      textAlign: TextAlign.start,
                      textSize: 14.0,
                      textWeight: FontWeight.bold),
                ),
              ),
            )),
            SizedBox(width: 16),
            Expanded(
                child: GestureDetector(
              onTap: () {
                Get.to(StudentFiltercouresresult());
              },
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.btnBlue),
                child: Center(
                  child: CommonWidgets().textWidget(
                      text: 'Apply Filter',
                      textColor: AppColors.whitecolor,
                      textAlign: TextAlign.start,
                      textSize: 14.0,
                      textWeight: FontWeight.bold),
                ),
              ),
            )),
          ],
        ),
      ],
    );
  }

  Widget Ratingstar() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1,
          color: Colors.blueGrey.shade100,
        ),
      ),
      child: Row(
        children: [
          RatingBar.builder(
            initialRating: 2.5,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemSize: 22,
            glow: false,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: CommonWidgets().textWidget(
                text: '3 Stars and up',
                textAlign: TextAlign.start,
                textSize: 14.0,
                textColor: AppColors.greycolor,
                textWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget buildDropdown(
      String label, RxString selectedValue, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonWidgets().textWidget(
            text: label,
            textAlign: TextAlign.start,
            textSize: 14.0,
            textWeight: FontWeight.bold),
        SizedBox(height: 8),
        DropdownButtonFormField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
              borderSide: BorderSide(
                  color: AppColors.btnborder, width: 1), //<-- SEE HERE
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
              borderSide: BorderSide(
                  color: AppColors.btnborder, width: 1), //<-- SEE HERE
            ),
            filled: false,
          ),
          value: selectedValue.value,
          items: items
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: CommonWidgets().textWidget(
                        text: e,
                        textAlign: TextAlign.start,
                        textSize: 13.0,
                        textWeight: FontWeight.w400),
                  ))
              .toList(),
          onChanged: (value) {
            if (value != null) selectedValue.value = value;
          },
        ),
      ],
    );
  }
}
