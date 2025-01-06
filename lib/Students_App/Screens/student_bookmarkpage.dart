// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_to_code/Constrant/common_widgets.dart';
import 'package:learn_to_code/Constrant/utilities.dart';
import 'package:learn_to_code/Students_App/Helpers/student_coures.dart';
import '../Controllers/student_allcoureseslist_controller.dart';

class StudentBookmarkpage extends StatelessWidget {
  final StudentAllcoureseslistController controller =
      Get.put(StudentAllcoureseslistController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
           backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          title: CommonWidgets()
              .textWidget(text: "Bookmark", textWeight: FontWeight.w600),
        ),
        body: Obx(() {
          if (controller.favoriteIds.isEmpty) {
            return Center(
              child: Text("No favorites added yet."),
            );
          }
          return ListView(
            children: controller.favoriteIds.map((id) {
              final item = getItemById(id);
              if (item == null) {
                return ListTile(
                  title: Text('Item not found'),
                  subtitle: Text('No course details available'),
                );
              }
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.btnborder)),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: CommonWidgets().textWidget(
                      text: item.title,
                      textSize: 14.0,
                      textmaxLine: 2,
                      textoverFlow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      textWeight: FontWeight.w700),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: CommonWidgets().textWidget(
                        text: item.author,
                        textSize: 12.0,
                        textmaxLine: 1,
                        textoverFlow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        textWeight: FontWeight.w500),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.bookmark_remove, color: Colors.red),
                    onPressed: () {
                      controller.toggleFavorite(id); // Remove from favorites
                    },
                  ),
                ),
              );
            }).toList(),
          );
        }),
      ),
    );
  }

  StudentCoures? getItemById(String id) {
    return controller.courses.firstWhere(
      (course) => course.id == id,
    );
  }
}
