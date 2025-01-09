import 'package:get/get.dart';

class ParentsResultController extends GetxController {
  // Sample data for months and their percentages
  var studentResults = <StudentResult>[
    StudentResult(
      month: "January",
      marks: 85,
      totalMarks: 100,
      subjects: [
        SubjectResult(subject: "Math", marks: 85, totalMarks: 100),
        SubjectResult(subject: "Science", marks: 75, totalMarks: 100),
        SubjectResult(subject: "English", marks: 90, totalMarks: 100),
      ],
    ),
    StudentResult(
      month: "February",
      marks: 78,
      totalMarks: 100,
      subjects: [
        SubjectResult(subject: "Math", marks: 80, totalMarks: 100),
        SubjectResult(subject: "Science", marks: 70, totalMarks: 100),
        SubjectResult(subject: "English", marks: 84, totalMarks: 100),
      ],
    ),
    StudentResult(
      month: "March",
      marks: 88,
      totalMarks: 100,
      subjects: [
        SubjectResult(subject: "Math", marks: 88, totalMarks: 100),
        SubjectResult(subject: "Science", marks: 80, totalMarks: 100),
        SubjectResult(subject: "English", marks: 96, totalMarks: 100),
      ],
    ),
    StudentResult(
      month: "April",
      marks: 90,
      totalMarks: 100,
      subjects: [
        SubjectResult(subject: "Math", marks: 92, totalMarks: 100),
        SubjectResult(subject: "Science", marks: 85, totalMarks: 100),
        SubjectResult(subject: "English", marks: 93, totalMarks: 100),
      ],
    ),
    StudentResult(
      month: "May",
      marks: 82,
      totalMarks: 100,
      subjects: [
        SubjectResult(subject: "Math", marks: 84, totalMarks: 100),
        SubjectResult(subject: "Science", marks: 78, totalMarks: 100),
        SubjectResult(subject: "English", marks: 86, totalMarks: 100),
      ],
    ),
    StudentResult(
      month: "June",
      marks: 75,
      totalMarks: 100,
      subjects: [
        SubjectResult(subject: "Math", marks: 76, totalMarks: 100),
        SubjectResult(subject: "Science", marks: 72, totalMarks: 100),
        SubjectResult(subject: "English", marks: 78, totalMarks: 100),
      ],
    ),
    StudentResult(
      month: "July",
      marks: 80,
      totalMarks: 100,
      subjects: [
        SubjectResult(subject: "Math", marks: 82, totalMarks: 100),
        SubjectResult(subject: "Science", marks: 78, totalMarks: 100),
        SubjectResult(subject: "English", marks: 80, totalMarks: 100),
      ],
    ),
    StudentResult(
      month: "August",
      marks: 85,
      totalMarks: 100,
      subjects: [
        SubjectResult(subject: "Math", marks: 87, totalMarks: 100),
        SubjectResult(subject: "Science", marks: 80, totalMarks: 100),
        SubjectResult(subject: "English", marks: 88, totalMarks: 100),
      ],
    ),
    StudentResult(
      month: "September",
      marks: 78,
      totalMarks: 100,
      subjects: [
        SubjectResult(subject: "Math", marks: 80, totalMarks: 100),
        SubjectResult(subject: "Science", marks: 75, totalMarks: 100),
        SubjectResult(subject: "English", marks: 79, totalMarks: 100),
      ],
    ),
    StudentResult(
      month: "October",
      marks: 92,
      totalMarks: 100,
      subjects: [
        SubjectResult(subject: "Math", marks: 94, totalMarks: 100),
        SubjectResult(subject: "Science", marks: 88, totalMarks: 100),
        SubjectResult(subject: "English", marks: 93, totalMarks: 100),
      ],
    ),
    StudentResult(
      month: "November",
      marks: 89,
      totalMarks: 100,
      subjects: [
        SubjectResult(subject: "Math", marks: 90, totalMarks: 100),
        SubjectResult(subject: "Science", marks: 85, totalMarks: 100),
        SubjectResult(subject: "English", marks: 92, totalMarks: 100),
      ],
    ),
    StudentResult(
      month: "December",
      marks: 95,
      totalMarks: 100,
      subjects: [
        SubjectResult(subject: "Math", marks: 96, totalMarks: 100),
        SubjectResult(subject: "Science", marks: 92, totalMarks: 100),
        SubjectResult(subject: "English", marks: 97, totalMarks: 100),
      ],
    ),
  ].obs;
}

// Model for student result
class StudentResult {
  final String month;
  final int marks;
  final int totalMarks;
  final List<SubjectResult> subjects;

  StudentResult({
    required this.month,
    required this.marks,
    required this.totalMarks,
    required this.subjects,
  });

  String get grade {
    double percentage = (marks / totalMarks) * 100;
    if (percentage >= 90) return "A";
    if (percentage >= 75) return "B";
    if (percentage >= 60) return "C";
    return "D";
  }

  String get cgpa {
    double percentage = (marks / totalMarks) * 100;
    return (percentage / 10).toStringAsFixed(2);
  }

  String get status => marks >= (totalMarks * 0.4) ? "Pass" : "Fail";
}

// Model for subject result
class SubjectResult {
  final String subject;
  final int marks;
  final int totalMarks;

  SubjectResult({
    required this.subject,
    required this.marks,
    required this.totalMarks,
  });
}
