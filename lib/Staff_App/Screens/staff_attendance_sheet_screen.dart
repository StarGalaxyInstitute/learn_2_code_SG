// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_to_code/Constrant/utilities.dart';

import '../../Constrant/common_widgets.dart';
import '../Controllers/staff_attendance_controller.dart';

class StaffAttendanceSheetScreen extends StatelessWidget {
  final StaffAttendanceController controller =
      Get.put(StaffAttendanceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
           backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: CommonWidgets().textWidget(
            text: "Attendance Sheet",
            textSize: 17.0,
            textAlign: TextAlign.start,
            textWeight: FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Month Dropdown
            Obx(() => DropdownButton<String>(
                  value: controller.selectedMonth.value,
                  onChanged: (value) {
                    if (value != null) {
                      controller.selectedMonth.value = value;
                    }
                  },
                  items: [
                    'January',
                    'February',
                    'March',
                    'April',
                    'May',
                    'June',
                    'July',
                    'August',
                    'September',
                    'October',
                    'November',
                    'December'
                  ].map((month) {
                    return DropdownMenuItem(
                      value: month,
                      child: CommonWidgets().textWidget(
                          text: month,
                          textSize: 15.0,
                          textAlign: TextAlign.start,
                          textWeight: FontWeight.bold),
                    );
                  }).toList(),
                )),

            const SizedBox(height: 20),

            // Attendance Sections
            Expanded(
              child: ListView.builder(
                itemCount: controller.attendanceData.length,
                itemBuilder: (context, index) {
                  final subject = controller.attendanceData[index]['subject'];
                  final attendance = controller.attendanceData[index]
                      ['attendance'] as List<bool>;

                  // Calculate average attendance
                  final totalClasses = attendance.length;
                  final attendedClasses =
                      attendance.where((status) => status).length;
                  final attendancePercentage =
                      (attendedClasses / totalClasses * 100).toStringAsFixed(0);

                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.btnborder)),
                    margin: EdgeInsets.only(bottom: 16.0),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonWidgets().textWidget(
                              text: subject.toString(),
                              textSize: 17.0,
                              textAlign: TextAlign.start,
                              textWeight: FontWeight.bold),
                          const SizedBox(height: 10),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 7,
                              childAspectRatio: 1.5,
                              crossAxisSpacing: 4.0,
                              mainAxisSpacing: 4.0,
                            ),
                            itemCount: attendance.length,
                            itemBuilder: (context, index) {
                              return Icon(
                                attendance[index] ? Icons.check : Icons.close,
                                color: attendance[index]
                                    ? Colors.green
                                    : Colors.red,
                              );
                            },
                          ),
                          const SizedBox(height: 10),
                          CommonWidgets().textWidget(
                              text: 'Total Classes: $totalClasses',
                              textSize: 14.0,
                              textAlign: TextAlign.start,
                              textWeight: FontWeight.w600),
                          CommonWidgets().textWidget(
                              text:
                                  'Average Attendance: $attendancePercentage%',
                              textSize: 14.0,
                              textAlign: TextAlign.start,
                              textWeight: FontWeight.w600),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
