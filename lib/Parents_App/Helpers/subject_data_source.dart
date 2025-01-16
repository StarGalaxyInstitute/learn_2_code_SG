// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../Constrant/common_widgets.dart';
import '../../Constrant/utilities.dart';
import '../Controllers/parents_result_controller.dart';

class SubjectDataSource extends DataGridSource {
  final List<SubjectResult> subjects;

  SubjectDataSource({required this.subjects}) {
    _dataGridRows = subjects.asMap().entries.map<DataGridRow>((entry) {
      int index = entry.key + 1;
      SubjectResult subject = entry.value;

      return DataGridRow(cells: [
        DataGridCell<int>(columnName: 'number', value: index),
        DataGridCell<String>(columnName: 'subjectName', value: subject.subject),
        DataGridCell<int>(columnName: 'totalMarks', value: subject.totalMarks),
        DataGridCell<int>(columnName: 'studentMarks', value: subject.marks),
        DataGridCell<String>(
            columnName: 'grade',
            value: _calculateGrade(subject.marks, subject.totalMarks)),
      ]);
    }).toList();
  }

  List<DataGridRow> _dataGridRows = [];

  @override
  List<DataGridRow> get rows => _dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        alignment: Alignment.center,
        child: CommonWidgets().textWidget(
          text: row.getCells()[0].value.toString(),
          textWeight: FontWeight.bold,
          textColor: AppColors.btnBlue,
          textSize: 16.0,
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        alignment: Alignment.centerLeft,
        child: CommonWidgets().textWidget(
          text: row.getCells()[1].value.toString(),
          textWeight: FontWeight.bold,
          textSize: 13.0,
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        alignment: Alignment.center,
        child: CommonWidgets().textWidget(
          text: row.getCells()[2].value.toString(),
          textWeight: FontWeight.bold,
          textSize: 13.0,
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        alignment: Alignment.center,
        child: CommonWidgets().textWidget(
          text: row.getCells()[3].value.toString(),
          textWeight: FontWeight.w500,
          textSize: 13.0,
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        alignment: Alignment.center,
        child: CommonWidgets().textWidget(
          text: row.getCells()[4].value.toString(),
          textWeight: FontWeight.bold,
          textSize: 13.0,
        ),
      ),
    ]);
  }

  String _calculateGrade(int marks, int totalMarks) {
    double percentage = (marks / totalMarks) * 100;
    if (percentage >= 90) return "A";
    if (percentage >= 75) return "B";
    if (percentage >= 60) return "C";
    return "D";
  }
}
