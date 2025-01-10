// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../Constrant/common_widgets.dart';
import '../../Constrant/utilities.dart';
import '../Controllers/parents_home_controller.dart';
import '../Controllers/parents_result_controller.dart';
import 'parents_monthresultsscreen.dart';

class ParentsResultsScreen extends StatelessWidget {
  final ParentsResultController controller = Get.put(ParentsResultController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CommonWidgets().textWidget(
          text: "Student Results",
          textWeight: FontWeight.bold,
          textSize: 17.0,
        ),
      ),
      body: ListView.builder(
        itemCount: controller.studentResults.length,
        itemBuilder: (context, index) {
          final result = controller.studentResults[index];
          double percentage = (result.marks / result.totalMarks) * 100;

          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.btnborder),
                borderRadius: BorderRadius.circular(10.0)),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: CommonWidgets().textWidget(
                textmaxLine: 1,
                textWeight: FontWeight.bold,
                textoverFlow: TextOverflow.ellipsis,
                text: "${result.month} - ${percentage.toStringAsFixed(2)}%",
                textSize: 16.0,
              ),
              subtitle: CommonWidgets().textWidget(
                textmaxLine: 1,
                textoverFlow: TextOverflow.ellipsis,
                textColor: AppColors.greycolor,
                textWeight: FontWeight.w500,
                text: "Grade: ${result.grade}, Status: ${result.status}",
                textSize: 13.0,
              ),
              trailing: Icon(Icons.arrow_forward, color: AppColors.btnBlue),
              onTap: () {
                Get.to(() => ParentsMonthresultsscreen(result: result));
              },
            ),
          );
        },
      ),
    );
  }
}
