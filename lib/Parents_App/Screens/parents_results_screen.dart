import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../Controllers/parents_home_controller.dart';
import '../Controllers/parents_result_controller.dart';
import 'parents_monthresultsscreen.dart';

class ParentsResultsScreen extends StatelessWidget {
  final ParentsResultController controller = Get.put(ParentsResultController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Results'),
        backgroundColor: Colors.purple,
      ),
      body: Obx(() => ListView.builder(
            itemCount: controller.studentResults.length,
            itemBuilder: (context, index) {
              final result = controller.studentResults[index];
              double percentage = (result.marks / result.totalMarks) * 100;

              return ListTile(
                title: Text(
                  "${result.month} - ${percentage.toStringAsFixed(2)}%",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle:
                    Text("Grade: ${result.grade}, Status: ${result.status}"),
                trailing: Icon(Icons.arrow_forward, color: Colors.purple),
                onTap: () {
                  Get.to(() => ParentsMonthresultsscreen(result: result));
                },
              );
            },
          )),
    );
  }
}
