// ignore_for_file: prefer_const_constructors, must_be_immutable, override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../Constrant/common_widgets.dart';
import '../../Constrant/utilities.dart';
import '../Controllers/parents_result_controller.dart';
import '../Helpers/subject_data_source.dart';

class ParentsMonthresultsscreen extends StatelessWidget {
  final StudentResult result;
  DataGridController dataGridController = DataGridController();

  ParentsMonthresultsscreen({required this.result});

  @override
  Widget build(BuildContext context) {
    final SubjectDataSource dataSource =
        SubjectDataSource(subjects: result.subjects);

    return Scaffold(
      appBar: AppBar(
        title: CommonWidgets().textWidget(
          text: "${result.month} Results",
          textWeight: FontWeight.bold,
          textSize: 17.0,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              child: CommonWidgets().textWidget(
                text: "Subject-Wise Results :",
                textWeight: FontWeight.bold,
                textSize: 17.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: SfDataGrid(
                columnWidthMode: ColumnWidthMode.fill,
                headerGridLinesVisibility: GridLinesVisibility.both,
                gridLinesVisibility: GridLinesVisibility.both,
                source: dataSource,
                controller: dataGridController,
                columns: [
                  GridColumn(
                    columnName: 'number',
                    label: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(8.0),
                      child: CommonWidgets().textWidget(
                        text: 'No.',
                        textWeight: FontWeight.bold,
                        textSize: 13.0,
                      ),
                    ),
                  ),
                  GridColumn(
                    columnName: 'subjectName',
                    label: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(8.0),
                      child: CommonWidgets().textWidget(
                        text: "Subject",
                        textWeight: FontWeight.bold,
                        textSize: 13.0,
                      ),
                    ),
                  ),
                  GridColumn(
                    columnName: 'totalMarks',
                    label: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(8.0),
                      child: CommonWidgets().textWidget(
                        text: "Total\n Marks",
                        textWeight: FontWeight.bold,
                        textSize: 12.0,
                      ),
                    ),
                  ),
                  GridColumn(
                    columnName: 'studentMarks',
                    label: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(8.0),
                      child: CommonWidgets().textWidget(
                        text: "Marks \nObtaine",
                        textWeight: FontWeight.bold,
                        textSize: 12.0,
                      ),
                    ),
                  ),
                  GridColumn(
                    columnName: 'grade',
                    label: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(8.0),
                      child: CommonWidgets().textWidget(
                        text: 'Grade',
                        textWeight: FontWeight.bold,
                        textSize: 13.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              child: CommonWidgets().textWidget(
                text: "Overall Performance",
                textWeight: FontWeight.bold,
                textSize: 17.0,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.btnborder),
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: CommonWidgets().textWidget(
                  text: "Total Marks",
                  textWeight: FontWeight.bold,
                  textSize: 15.0,
                ),
                trailing: CommonWidgets().textWidget(
                  text: "${result.marks}/${result.totalMarks}",
                  textWeight: FontWeight.w600,
                  textSize: 14.0,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.btnborder),
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: CommonWidgets().textWidget(
                  text: "Grade",
                  textWeight: FontWeight.bold,
                  textSize: 15.0,
                ),
                trailing: CommonWidgets().textWidget(
                  text: result.grade,
                  textWeight: FontWeight.w600,
                  textSize: 14.0,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.btnborder),
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: CommonWidgets().textWidget(
                  text: "CGPA",
                  textWeight: FontWeight.bold,
                  textSize: 15.0,
                ),
                trailing: CommonWidgets().textWidget(
                  text: result.cgpa,
                  textWeight: FontWeight.w600,
                  textSize: 14.0,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.btnborder),
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: CommonWidgets().textWidget(
                  text: "Status",
                  textWeight: FontWeight.bold,
                  textSize: 15.0,
                ),
                trailing: CommonWidgets().textWidget(
                  text: result.status,
                  textWeight: FontWeight.w600,
                  textSize: 14.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
