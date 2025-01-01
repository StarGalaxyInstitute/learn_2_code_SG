import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
        title: Text('Filters',
            style: GoogleFonts.lato(
                textStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 17))),
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
            Text("I'm looking for",
                style: GoogleFonts.lato(
                    textStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14))),
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
                        child: Text(
                          'Tutors',
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                            fontSize: 16,
                            color: controller.isfilterTab
                                ? AppColors.whitecolor
                                : Colors.grey,
                            fontWeight: FontWeight.bold,
                          )),
                        ),
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
                        child: Text(
                          'Courses',
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                            fontSize: 16,
                            color: !controller.isfilterTab
                                ? AppColors.whitecolor
                                : Colors.grey,
                            fontWeight: FontWeight.bold,
                          )),
                        ),
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
        Text('Availability',
            style: GoogleFonts.lato(
                textStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 14))),
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
                        label: Text(
                          day,
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 13)),
                        ),
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
        Text('Timeslots',
            style: GoogleFonts.lato(
                textStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 14))),
        Obx(() => Wrap(
              spacing: 10,
              children: ['Morning', 'Afternoon', 'Evening']
                  .map((slot) => ChoiceChip(
                        label: Text(
                          slot,
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 13)),
                        ),
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
        Text('Rating',
            style: GoogleFonts.lato(
                textStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 14))),
        SizedBox(height: 8),
        Ratingstar(),
        const SizedBox(height: 16),
        // Hourly Rate Slider
        Text('Hourly Rate',
            style: GoogleFonts.lato(
                textStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 14))),
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
                  child: Text('Reset Filter',
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14))),
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
                  child: Text('Apply Filter',
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14))),
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
        Text('Rating',
            style: GoogleFonts.lato(
                textStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 14))),
        SizedBox(height: 8),
        Ratingstar(),
        const SizedBox(height: 16),
        // Hourly Rate Slider
        Text('Price Range',
            style: GoogleFonts.lato(
                textStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 14))),
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
        Text("Duration",
            style: GoogleFonts.lato(
                textStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 14))),
        SizedBox(height: 1),
        Obx(() => Wrap(
              spacing: 10,
              children: ['<1 hr', '1-3 hrs', '3-6 hrs', '6+ hrs']
                  .map((slot) => ChoiceChip(
                        label: Text(
                          slot,
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 13)),
                        ),
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
                  child: Text('Reset Filter',
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14))),
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
                  child: Text('Apply Filter',
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14))),
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
            child: Text('3 Stars and up',
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: AppColors.greycolor))),
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
        Text(label,
            style: GoogleFonts.lato(
                textStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 14))),
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
          dropdownColor: Colors.white,
          value: selectedValue.value,
          items: items
              .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(
                    e,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 13)),
                  )))
              .toList(),
          onChanged: (value) {
            if (value != null) selectedValue.value = value;
          },
        ),
      ],
    );
  }

  Widget buildDurationButton(String text, {bool isSelected = false}) {
    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          isSelected = true;
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.purple : Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        margin: EdgeInsets.only(right: 8),
        child: Text(
          text,
          style: TextStyle(color: isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
