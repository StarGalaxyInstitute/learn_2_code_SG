import 'package:flutter/material.dart';
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
        title: Text('Filters'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Looking For Section
            Text("I'm looking for",
                style: GoogleFonts.rubik(
                    textStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 17))),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      controller.isfilterTab = true;
                    });
                  },
                  child: Container(
                    decoration: controller.isfilterTab
                        ? BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                AppColors.btnBlue,
                                AppColors.btnBluelight
                              ],
                            ),
                          )
                        : BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            // border: Border.all(
                            //   width: 1,
                            //   color: AppColors.greycolor,
                            // ),
                            color: Colors.blue.shade100,
                          ),
                    padding: EdgeInsets.symmetric(horizontal: 45, vertical: 12),
                    child: Text(
                      'Tutors',
                      style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                        fontSize: 16,
                        color: controller.isfilterTab
                            ? AppColors.whitecolor
                            : Colors.grey,
                        fontWeight: FontWeight.w400,
                      )),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      controller.isfilterTab = false;
                    });
                  },
                  child: Container(
                    decoration: !controller.isfilterTab
                        ? BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                AppColors.btnBlue,
                                AppColors.btnBluelight
                              ],
                            ),
                          )
                        : BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              width: 1,
                              color: AppColors.greycolor,
                            ),
                            color: Colors.transparent,
                          ),
                    padding: EdgeInsets.symmetric(horizontal: 45, vertical: 12),
                    child: Text(
                      'Courses',
                      style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                        fontSize: 16,
                        color: !controller.isfilterTab
                            ? AppColors.whitecolor
                            : Colors.grey,
                        fontWeight: FontWeight.w400,
                      )),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
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
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
// Subject Dropdown
        Text('Subject',
            style: GoogleFonts.rubik(
                textStyle:
                    TextStyle(fontWeight: FontWeight.w500, fontSize: 17))),
        Obx(() => Padding(
              padding: const EdgeInsets.all(10.0),
              child: DropdownButton<String>(
                borderRadius: BorderRadius.circular(10),
                value: controller.selectedSubject.value,
                focusColor: AppColors.darkBlue,
                isExpanded: true,
                items: ['MAT 116', 'MAT 117', 'MAT 118']
                    .map((subject) => DropdownMenuItem(
                          value: subject,
                          child: Text(
                            subject,
                            style: GoogleFonts.rubik(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 14)),
                          ),
                        ))
                    .toList(),
                onChanged: (value) => controller.selectedSubject.value = value!,
              ),
            )),
        SizedBox(height: 16),
        // Availability Section
        Text('Availability',
            style: GoogleFonts.rubik(
                textStyle:
                    TextStyle(fontWeight: FontWeight.w500, fontSize: 17))),

        Obx(() => Wrap(
              spacing: 8,
              children: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday']
                  .map((day) => ChoiceChip(
                        label: Text(
                          day,
                          style: GoogleFonts.rubik(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 14)),
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
            style: GoogleFonts.rubik(
                textStyle:
                    TextStyle(fontWeight: FontWeight.w500, fontSize: 17))),
        Obx(() => Wrap(
              spacing: 8,
              children: ['Morning', 'Afternoon', 'Evening']
                  .map((slot) => ChoiceChip(
                        label: Text(
                          slot,
                          style: GoogleFonts.rubik(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 14)),
                        ),
                        selected: controller.selectedTimeslot.value == slot,
                        onSelected: (selected) => controller
                            .selectedTimeslot.value = selected ? slot : '',
                      ))
                  .toList(),
            )),
        const SizedBox(height: 16),
        // Tutoring Experience Dropdown
        Text('Tutoring Experience',
            style: GoogleFonts.rubik(
                textStyle:
                    TextStyle(fontWeight: FontWeight.w500, fontSize: 17))),
        Obx(() => DropdownButton<String>(
              value: controller.experience.value,
              isExpanded: true,
              items: ['1-3 Years', '3-5 Years', '5+ Years']
                  .map((exp) => DropdownMenuItem(
                        value: exp,
                        child: Text(
                          exp,
                          style: GoogleFonts.rubik(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 14)),
                        ),
                      ))
                  .toList(),
              onChanged: (value) => controller.experience.value = value!,
            )),
        const SizedBox(height: 16),
        // Degrees Dropdown
        Text('Degrees and certifications',
            style: GoogleFonts.rubik(
                textStyle:
                    TextStyle(fontWeight: FontWeight.w500, fontSize: 17))),
        Obx(() => DropdownButton<String>(
              value: controller.degree.value,
              isExpanded: true,
              items: [
                "Master's in Applied Mathematics",
                "Bachelor's in Computer Science"
              ]
                  .map((degree) => DropdownMenuItem(
                        value: degree,
                        child: Text(
                          degree,
                          style: GoogleFonts.rubik(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 14)),
                        ),
                      ))
                  .toList(),
              onChanged: (value) => controller.degree.value = value!,
            )),
        const SizedBox(height: 16),
        // Rating Section
        Text('Rating',
            style: GoogleFonts.rubik(
                textStyle:
                    TextStyle(fontWeight: FontWeight.w500, fontSize: 17))),
        Obx(() => Row(
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < controller.rating.value
                        ? Icons.star
                        : Icons.star_border,
                    color: Colors.orange,
                  ),
                  onPressed: () => controller.rating.value = index + 1,
                );
              }),
            )),
        const SizedBox(height: 16),

        // Hourly Rate Slider
        Text('Hourly Rate',
            style: GoogleFonts.rubik(
                textStyle:
                    TextStyle(fontWeight: FontWeight.w500, fontSize: 17))),
        Obx(() => RangeSlider(
              values: controller.hourlyRate.value,
              min: 0,
              max: 50,
              divisions: 50,
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
              child: ElevatedButton(
                onPressed: controller.resetFilters,
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.grey[300]),
                child: Text('Reset Filter',
                    style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15))),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Get.to(StudentFiltertutorResult());
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                child: Text(
                  'Apply Filter',
                  style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCoursesForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        buildDropdown("Course Category", controller.selectedCategory,
            ["Programming", "Design", "Marketing"]),
        SizedBox(height: 16),
        buildDropdown("Difficulty Level", controller.selectedDifficulty,
            ["Beginner", "Intermediate", "Advanced"]),
        SizedBox(height: 16),
        Text("Rating", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Obx(() => Row(
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < controller.selectedRating.value
                        ? Icons.star
                        : Icons.star_border,
                    color: Colors.orange,
                  ),
                  onPressed: () {
                    controller.selectedRating.value = index + 1;
                  },
                );
              }),
            )),
        SizedBox(height: 8),
        Text("${controller.selectedRating.value} Stars and up"),
        SizedBox(height: 16),
        Text("Price Range", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Obx(() => RangeSlider(
              values: controller.priceRange.value,
              min: 0,
              max: 50,
              divisions: 50,
              activeColor: Colors.purple,
              onChanged: (values) {
                controller.priceRange.value = values;
              },
            )),
        Obx(() => Text(
            "\$${controller.priceRange.value.start.toInt()} - \$${controller.priceRange.value.end.toInt()}")),
        SizedBox(height: 16),
        Text("Duration", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Row(
          children: [
            buildDurationButton("<1 hr"),
            buildDurationButton("1-3 hrs"),
            buildDurationButton("3-6 hrs", isSelected: true),
            buildDurationButton("6+ hrs"),
          ],
        ),
        SizedBox(height: 16),
        buildDropdown("Released", controller.selectedRelease,
            ["In last 6 Month", "In last Year", "All Time"]),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => controller.resetFilters(),
                child: Text("Reset Filter"),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Get.to(StudentFiltercouresresult());
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                child: Text("Apply Filter"),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildDropdown(
      String label, RxString selectedValue, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Obx(() => DropdownButton<String>(
              value: selectedValue.value,
              onChanged: (value) {
                if (value != null) selectedValue.value = value;
              },
              isExpanded: true,
              items: items
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
            )),
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
