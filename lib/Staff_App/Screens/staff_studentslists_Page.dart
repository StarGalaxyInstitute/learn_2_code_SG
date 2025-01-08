// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_to_code/Constrant/utilities.dart';

import '../../Constrant/common_widgets.dart';
import '../Controllers/staff_studentslist_controller.dart';

class StaffStudentslistsPage extends StatelessWidget {
  final StaffStudentslistController controller =
      Get.put(StaffStudentslistController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
           backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: CommonWidgets().textWidget(
            text: 'My Students',
            textSize: 17.0,
            textAlign: TextAlign.start,
            textWeight: FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: controller.student.length,
          itemBuilder: (context, index) {
            final student = controller.student[index];
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.btnborder),
                  borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.only(bottom: 16.0),
              child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(student.image),
                  ),
                  title: CommonWidgets().textWidget(
                      text: student.name,
                      textSize: 16.0,
                      textmaxLine: 1,
                      textoverFlow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      textWeight: FontWeight.bold),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonWidgets().textWidget(
                          text: student.batch,
                          textSize: 13.0,
                          textmaxLine: 1,
                          textoverFlow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          textWeight: FontWeight.w600),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 14.0,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 4.0),
                          CommonWidgets().textWidget(
                              text: student.location,
                              textSize: 12.0,
                              textmaxLine: 1,
                              textoverFlow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              textWeight: FontWeight.w400),
                        ],
                      ),
                    ],
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      Get.snackbar(
                        'Chat',
                        'Starting chat with ${student.name}',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    },
                    child: Container(
                      height: 30,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.btnBlue),
                      child: Center(
                        child: CommonWidgets().textWidget(
                            text: 'Chat',
                            textColor: AppColors.whitecolor,
                            textAlign: TextAlign.start,
                            textSize: 12.0,
                            textWeight: FontWeight.bold),
                      ),
                    ),
                  )),
            );
          },
        ),
      ),
    );
  }
}
