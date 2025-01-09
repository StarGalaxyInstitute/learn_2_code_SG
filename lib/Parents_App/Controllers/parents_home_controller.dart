import 'package:get/get.dart';

class ParentsHomeController extends GetxController {
  var userName = "Sakshi Choudhary".obs;
  var userdetails = "Attendance Details".obs;

  // Classes Data
  var classes = [
    {"initial": "M", "subject": "Mathematics I", "time": "09:30 am"},
    {"initial": "P", "subject": "Physics", "time": "10:40 am"},
    {"initial": "B", "subject": "Biology", "time": "11:45 am"},
    {"initial": "G", "subject": "Geography", "time": "12:10 am"},
  ].obs;

  var attendance = [
    {
      "initial": "M",
      "subject": "Mathematics I",
      "time": "09:30 am",
      "attendence": "Present"
    },
    {
      "initial": "P",
      "subject": "Physics",
      "time": "10:40 am",
      "attendence": "Absent"
    },
    {
      "initial": "B",
      "subject": "Biology",
      "time": "11:45 am",
      "attendence": "Present"
    },
    {
      "initial": "G",
      "subject": "Geography",
      "time": "12:10 am",
      "attendence": "Absent"
    },
  ].obs;
}
