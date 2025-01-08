import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Courses {
  final String title;
  final String classes;
  final String details;
  final IconData icon;
  final String duration;
  final Color color;
  final Color colorbg;

  Courses({
    required this.title,
    required this.classes,
    required this.details,
    required this.icon,
    required this.duration,
    required this.color,
    required this.colorbg,
  });
}

class StaffCoursesController extends GetxController {
  var selectedTutor = Rxn<Courses>();

  void selectIndex(Courses tutor) {
    selectedTutor.value = tutor;
  }

  var courses = <Courses>[
    Courses(
        title: "Job Preparation Full Course",
        classes: "30+ Classes",
        details: "Top course module\nLive class + Video",
        icon: Icons.work,
        duration: "6 Months",
        color: Colors.blue.shade50,
        colorbg: Colors.blue),
    Courses(
        title: "MS Word complete beginner to advanced",
        classes: "30+ Classes",
        details: "Top course module\nLive class + Video",
        icon: Icons.description,
        duration: "6 Months",
        color: Colors.deepPurple.shade50,
        colorbg: Colors.deepPurple),
    Courses(
        title: "MS Power Point zero to advanced course 2022",
        classes: "30+ Classes",
        details: "Top course module\nLive class + Video",
        icon: Icons.slideshow,
        duration: "6 Months",
        color: Colors.amber.shade50,
        colorbg: Colors.amber),
    Courses(
        title: "MS Excel complete course 2022",
        classes: "30+ Classes",
        details: "Top course module\nLive class + Video",
        icon: Icons.table_chart,
        duration: "6 Months",
        color: Colors.green.shade50,
        colorbg: Colors.green),
    Courses(
        title: "Job Preparation Full Course",
        classes: "30+ Classes",
        details: "Top course module\nLive class + Video",
        icon: Icons.work,
        duration: "6 Months",
        color: Colors.cyan.shade50,
        colorbg: Colors.cyan),
    Courses(
        title: "MS Word complete beginner to advanced",
        classes: "30+ Classes",
        details: "Top course module\nLive class + Video",
        icon: Icons.description,
        duration: "6 Months",
        color: Colors.purple.shade50,
        colorbg: Colors.purple),
    Courses(
        title: "MS Power Point zero to advanced course 2022",
        classes: "30+ Classes",
        details: "Top course module\nLive class + Video",
        icon: Icons.slideshow,
        duration: "6 Months",
        color: Colors.deepOrange.shade50,
        colorbg: Colors.deepOrange),
    Courses(
        title: "MS Excel complete course 2022",
        classes: "30+ Classes",
        details: "Top course module\nLive class + Video",
        icon: Icons.table_chart,
        duration: "6 Months",
        color: Colors.lightGreen.shade50,
        colorbg: Colors.lightGreen),
  ].obs;
}
