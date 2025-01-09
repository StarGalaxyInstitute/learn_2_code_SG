import 'package:get/get.dart';

class ParentsAttendenceController extends GetxController {

    var focusedDate = DateTime.now().obs;
  var selectedDate = DateTime.now().obs;

  // Map to store attendance data
  var attendanceData = <DateTime, String>{}.obs;

  // Get attendance status for a specific date
  String? getAttendanceStatus(DateTime date) {
    // Format the date to remove the time part for comparison
    DateTime formattedDate = DateTime(date.year, date.month, date.day);
    return attendanceData[formattedDate];
  }

  // Set attendance status for a specific date
  void setAttendanceStatus(DateTime date, String status) {
    // Format the date to remove the time part
    DateTime formattedDate = DateTime(date.year, date.month, date.day);
    attendanceData[formattedDate] = status;
  }

  // Optional: Initialize some sample data for testing (you can call this method)
  void initializeSampleData() {
    setAttendanceStatus(DateTime(2025, 1, 1), 'present');
    setAttendanceStatus(DateTime(2025, 1, 2), 'absent');
    setAttendanceStatus(DateTime(2025, 1, 3), 'half_day');
  }
}
