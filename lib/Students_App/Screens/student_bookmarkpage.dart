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
        title: Text('Favorite Courses'),
      ),
      body: Obx(() {
        var favoriteCourses = controller.favoriteCourses;
        return favoriteCourses.isEmpty
            ? Center(child: Text('No favorite courses yet!'))
            : ListView.builder(
                itemCount: favoriteCourses.length,
                itemBuilder: (context, index) {
                  var course = favoriteCourses[index];
                  return GestureDetector(
                    onTap: () {
                      controller.selectTutor(course);
                      Get.to(() => StudentAllCoursesDetailsScreen(
                          image: course.image,
                          title: course.title,
                          author: course.author,
                          rating: course.rating,
                          tag: course.tag,
                          details: course.details));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.btnborder)),
                      child: ListTile(
                        leading:
                            Image.asset(course.image, width: 50, height: 50),
                        title: CommonWidgets().textWidget(
                            text: course.title,
                            textSize: 12.0,
                            textmaxLine: 2,
                            textoverFlow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            textWeight: FontWeight.w700),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: CommonWidgets().textWidget(
                              text: course.author,
                              textSize: 11.0,
                              textmaxLine: 1,
                              textoverFlow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              textWeight: FontWeight.w500),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.favorite, color: Colors.red),
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
