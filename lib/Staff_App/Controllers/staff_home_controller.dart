import 'package:flutter/material.dart';
import 'package:get/get.dart';


class StaffHomeController extends GetxController {
  var searchText = ''.obs;

  // Example data for each section
  var categories = [
    {"title": "Students", "icon": Icons.person,},
    {"title": "Course list", "icon": Icons.list},
    {"title": "Nearby", "icon": Icons.location_on},
    {"title": "Progress", "icon": Icons.show_chart},
    {"title": "Assignment", "icon": Icons.assignment},
    {"title": "Payments", "icon": Icons.payment},
    {"title": "Attendance", "icon": Icons.event},
    {"title": "Support", "icon": Icons.support_agent},
  ].obs;




}