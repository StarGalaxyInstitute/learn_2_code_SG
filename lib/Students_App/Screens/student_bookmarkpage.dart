// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constrant/common_widgets.dart';
import '../../Constrant/utilities.dart';
import '../Controllers/student_allcoureseslist_controller.dart';
import 'Student_allcourses_detailsscreen.dart';

class StudentBookmarkpage extends StatelessWidget {
  final StudentAllcoureseslistController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CommonWidgets().textWidget(
            text: 'Favorite Courses',
            textSize: 17.0,
            textAlign: TextAlign.start,
            textWeight: FontWeight.bold),
      ),
      body: Obx(() {
        if (controller.favoriteCourses.isEmpty) {
          return Center(
            child: CommonWidgets().textWidget(
                text: 'No favorite courses yet.',
                textSize: 17.0,
                textAlign: TextAlign.start,
                textWeight: FontWeight.bold),
          );
        }

        return ListView.builder(
          itemCount: controller.favoriteCourses.length,
          itemBuilder: (context, index) {
            String course = controller.favoriteCourses[index];
            final course2 = controller.courses[index];
            return GestureDetector(
              onTap: () {
                Get.to(() => StudentAllCoursesDetailsScreen(
                    image: course2.image,
                    title: course,
                    author: course2.author,
                    rating: course2.rating,
                    tag: course2.tag,
                    details: course2.details));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.btnborder)),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: CommonWidgets().textWidget(
                      text: course,
                      textSize: 14.0,
                      textmaxLine: 2,
                      textoverFlow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      textWeight: FontWeight.w700),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: CommonWidgets().textWidget(
                        text: course2.author,
                        textSize: 12.0,
                        textmaxLine: 1,
                        textoverFlow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        textWeight: FontWeight.w500),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.bookmark_remove, color: Colors.red),
                    onPressed: () {
                      controller.toggleFavorite(course);
                    },
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
