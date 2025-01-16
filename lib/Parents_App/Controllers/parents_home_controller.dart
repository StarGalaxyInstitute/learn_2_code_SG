// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:learn_to_code/Constrant/common_widgets.dart';

import '../Screens/parent_progresschart_screen.dart';
import '../Screens/parents_attendance_screen.dart';
import '../Screens/parents_profile_screen.dart';
import '../Screens/parents_results_screen.dart';

class ParentsHomeController extends GetxController {
  List<StaggeredGridTile> cardTile = [
    StaggeredGridTile.count(
      crossAxisCellCount: 1,
      mainAxisCellCount: 2,
      child: GestureDetector(
          onTap: () {
            Get.to(ParentsResultsScreen());
          },
          child: BackGroundTile(
              boxtext: 'Results',
              backgroundColor: Colors.deepPurpleAccent.shade100,
              icondata: Icons.home)),
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 1,
      mainAxisCellCount: 1,
      child: GestureDetector(
          onTap: () {
            Get.to(ParentsAttendanceScreen());
          },
          child: BackGroundTile(
              boxtext: 'Attendence',
              backgroundColor: Colors.orange.shade100,
              icondata: Icons.ac_unit)),
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 1,
      mainAxisCellCount: 2,
      child: GestureDetector(
          onTap: () {
            Get.to(ParentProgresschartScreen());
          },
          child: BackGroundTile(
              boxtext: 'Progress',
              backgroundColor: Colors.pink.shade100,
              icondata: Icons.landscape)),
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 1,
      mainAxisCellCount: 1,
      child: GestureDetector(
          onTap: () {
            Get.to(ParentsProfileScreen());
          },
          child: BackGroundTile(
              boxtext: 'Profile',
              backgroundColor: Colors.green.shade100,
              icondata: Icons.portrait)),
    ),
  ];
}

class BackGroundTile extends StatelessWidget {
  final Color backgroundColor;
  final IconData icondata;
  final String boxtext;

  BackGroundTile(
      {required this.backgroundColor,
      required this.icondata,
      required this.boxtext});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Icon(
            icondata,
            color: Colors.black,
            size: 30,
          ),
          CommonWidgets().textWidget(text: boxtext)
        ],
      ),
    );
  }
}
