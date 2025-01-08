import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StaffAttendanceController extends GetxController {
  var selectedMonth = 'January'.obs;
  var attendanceData = [
    {
      'subject': 'Mathematics-1',
      'attendance': [
        true,
        false,
        true,
        true,
        false,
        true,
        true,
        true,
        true,
        false,
        true,
        true,
        true,
        true,
        true
      ],
    },
    {
      'subject': 'English Grammar',
      'attendance': [
        false,
        true,
        false,
        true,
        false,
        true,
        false,
        true,
        false,
        true,
        false,
        true,
        true,
        true,
        false
      ],
    },
    {
      'subject': 'Chemistry-2',
      'attendance': [
        true,
        true,
        true,
        false,
        true,
        true,
        false,
        true,
        true,
        false,
        true,
        true,
        true,
        true,
        true
      ],
    },
  ];
}
