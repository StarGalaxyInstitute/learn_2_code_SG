// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constrant/utilities.dart';
import '../Controllers/student_allcoureseslist_controller.dart';

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
                  return ListTile(
                    leading: Image.asset(course.image, width: 50, height: 50),
                    title: Text(course.title),
                    subtitle: Text(course.author),
                    trailing: IconButton(
                      icon: Icon(Icons.favorite, color: Colors.red),
                      onPressed: () {
                        controller.toggleFavorite(course);
                      },
                    ),
                  );
                },
              );
      }),
    );
  }
}
