// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'attendancecalendar.dart';
import 'parents_attendance_screen.dart';
import 'parents_results_screen.dart';

class ParentsHomepage extends StatelessWidget {
  ParentsHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildButton(
              'Results',
              Icons.school,
            ),
            SizedBox(height: 16),
            buildButton(
              'Attendance',
              Icons.event,
            ),
            SizedBox(height: 16),
            buildButton(
              'Progress',
              Icons.bar_chart,
            ),
            SizedBox(height: 16),
            buildButton(
              'Profile',
              Icons.person,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(String title, IconData icon) {
    return ElevatedButton.icon(
      onPressed: () {
        _navigateToScreen(title);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
        minimumSize: Size(double.infinity, 50),
      ),
      icon: Icon(icon, color: Colors.white),
      label: Text(title, style: TextStyle(fontSize: 16)),
    );
  }

  void _navigateToScreen(String title) {
    switch (title) {
      case "Results":
        Get.to(ParentsResultsScreen());
        break;
      case "Attendance":
        Get.to(ParentsAttendanceScreen());

        break;
      case "Progress":
        Get.to(AttendanceCalendar());
        break;
      case "Profile":
        break;
      case "Assignment":
        break;
      default:
        print("Invalid category");
    }
  }
}
