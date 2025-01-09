import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../Controllers/parents_result_controller.dart';
import '../Helpers/subject_data_source.dart';

class ParentsMonthresultsscreen extends StatelessWidget {
  final StudentResult result;

  ParentsMonthresultsscreen({required this.result});

  @override
  Widget build(BuildContext context) {
    final SubjectDataSource dataSource =
        SubjectDataSource(subjects: result.subjects);

    return Scaffold(
      appBar: AppBar(
        title: Text("${result.month} Results"),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Subject-Wise Results",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: SfDataGrid(
              source: dataSource,
              columnWidthMode: ColumnWidthMode.fill,
              columns: [
                GridColumn(
                  columnName: 'number',
                  label: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8.0),
                    child: Text('No.',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                GridColumn(
                  columnName: 'subjectName',
                  label: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8.0),
                    child: Text('Subject',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                GridColumn(
                  columnName: 'totalMarks',
                  label: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8.0),
                    child: Text('Total Marks',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                GridColumn(
                  columnName: 'studentMarks',
                  label: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8.0),
                    child: Text('Marks Obtained',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                GridColumn(
                  columnName: 'grade',
                  label: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8.0),
                    child: Text('Grade',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Overall Performance",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: Text("Total Marks"),
            trailing: Text("${result.marks}/${result.totalMarks}"),
          ),
          ListTile(
            title: Text("Grade"),
            trailing: Text(result.grade),
          ),
          ListTile(
            title: Text("CGPA"),
            trailing: Text(result.cgpa),
          ),
          ListTile(
            title: Text("Status"),
            trailing: Text(result.status),
          ),
        ],
      ),
    );
  }
}
